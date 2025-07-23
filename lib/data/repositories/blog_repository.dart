import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:drift/drift.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show ClientException;
import '../local/database/app_database.dart';

class BlogRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final AppDatabase _localDb = AppDatabase();
  RealtimeChannel? _blogsChannel;
  bool _isSubscribed = false;
  Timer? _connectivityTimer;

  BlogRepository() {
    // Periodically check connectivity and try to reconnect
    _connectivityTimer = Timer.periodic(const Duration(minutes: 1), (_) async {
      if (!_isSubscribed && await _hasInternetConnection()) {
        _setupRealtimeSubscription();
      }
    });
  }

  Future<List<Map<String, dynamic>>> getBlogs() async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return [];

      // Try to get blogs from local database first
      final localBlogs = await _localDb.getAllBlogs();
      
      // Check connectivity before making any network requests
      if (!await _hasInternetConnection()) {
        _handleOfflineMode();
        return _getLocalBlogs(localBlogs);
      }

      try {
        // Set up realtime subscription if not already subscribed
        _setupRealtimeSubscription();

        // Get user's following list
        final following = await _localDb.getFollowing(currentUserId);
        final followingIds = following.map((f) => f.followedId).toList();

        // Only try to fetch from server if we have following IDs
        List<Map<String, dynamic>> followingBlogs = [];
        List<Map<String, dynamic>> randomBlogs = [];

        if (followingIds.isNotEmpty) {
          try {
            // Fetch blogs from following users (70%)
            final response = await _supabase
                .from('blogs')
                .select('''
                  *,
                  users:userid (
                    username,
                    profilepic
                  )
                ''')
                .inFilter('userid', followingIds)
                .order('createdat', ascending: false)
                .limit(7);
            followingBlogs = List<Map<String, dynamic>>.from(response);
          } catch (e) {
            print('Error fetching following blogs: $e');
            if (_isNetworkError(e)) {
              _handleOfflineMode();
              return _getLocalBlogs(localBlogs);
            }
          }
        }

        try {
          // Fetch random blogs (30%)
          final response = await _supabase
              .from('blogs')
              .select('''
                *,
                users:userid (
                  username,
                  profilepic
                )
              ''')
              .not('userid', 'in', followingIds)
              .order('createdat', ascending: false)
              .limit(3);
          randomBlogs = List<Map<String, dynamic>>.from(response);
        } catch (e) {
          print('Error fetching random blogs: $e');
          if (_isNetworkError(e)) {
            _handleOfflineMode();
            return _getLocalBlogs(localBlogs);
          }
        }

        // Combine and process blogs
        final allBlogs = [...followingBlogs, ...randomBlogs];
        
        if (allBlogs.isNotEmpty) {
          // Update local database
          await _localDb.clearBlogs();
          await _localDb.insertBlogs(allBlogs.map((blog) => LocalBlogsCompanion(
            blogId: Value(blog['id']),
            userId: Value(blog['userid']),
            title: Value(blog['title']),
            description: Value(blog['description']),
            image: Value(blog['image']),
            category: Value(blog['category']),
            likesCount: Value(blog['likes_count'] ?? 0),
            commentsCount: Value(blog['comments_count'] ?? 0),
            isLiked: Value(blog['is_liked'] ?? false),
            createdAt: Value(DateTime.parse(blog['createdat'])),
            username: Value(blog['users']['username']),
            userProfilePic: Value(blog['users']['profilepic']),
            isFromFollowing: Value(followingIds.contains(blog['userid'])),
          )).toList());

          return allBlogs;
        }
      } catch (e) {
        print('Error syncing with server: $e');
        if (_isNetworkError(e)) {
          _handleOfflineMode();
        }
      }

      return _getLocalBlogs(localBlogs);
    } catch (e) {
      print('Error in getBlogs: $e');
      _handleOfflineMode();
      return [];
    }
  }

  List<Map<String, dynamic>> _getLocalBlogs(List<LocalBlog> localBlogs) {
    if (localBlogs.isEmpty) return [];
    
    return localBlogs.map((blog) => {
      'id': blog.blogId,
      'userid': blog.userId,
      'title': blog.title,
      'description': blog.description,
      'image': blog.image,
      'category': blog.category,
      'likes_count': blog.likesCount,
      'comments_count': blog.commentsCount,
      'is_liked': blog.isLiked,
      'createdat': blog.createdAt.toIso8601String(),
      'users': {
        'username': blog.username,
        'profilepic': blog.userProfilePic,
      },
    }).toList();
  }

  bool _isNetworkError(dynamic error) {
    return error is SocketException ||
           error is ClientException ||
           (error.toString().contains('SocketException') ||
            error.toString().contains('Failed host lookup'));
  }

  void _setupRealtimeSubscription() {
    if (_isSubscribed) return;

    try {
      _blogsChannel = _supabase
          .channel('public:blogs')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'blogs',
            callback: (payload) async {
              // Handle realtime updates
              await getBlogs(); // Refresh blogs when changes occur
            },
          );

      _blogsChannel?.subscribe(((status, error) {
        if (error != null) {
          print('Error subscribing to blogs changes: $error');
          _handleOfflineMode();
        } else if (status == 'SUBSCRIBED') {
          _isSubscribed = true;
          print('Successfully subscribed to blogs changes');
        }
      }));
    } catch (e) {
      print('Error setting up realtime subscription: $e');
      _handleOfflineMode();
    }
  }

  void _handleOfflineMode() {
    _isSubscribed = false;
    _blogsChannel?.unsubscribe();
    _blogsChannel = null;
  }

  Future<bool> _hasInternetConnection() async {
    try {
      // First try to reach a reliable host
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // If we can reach google.com, try the Supabase endpoint
        try {
          final response = await http.head(
            Uri.parse('https://jtdaxfuqpriywagqcuoa.supabase.co/rest/v1/'),
            headers: {'apikey': _supabase.rest.headers['apikey'] ?? ''},
          );
          return response.statusCode == 200;
        } catch (e) {
          print('Error checking Supabase connectivity: $e');
          return false;
        }
      }
      return false;
    } on SocketException catch (e) {
      print('No internet connection: $e');
      return false;
    }
  }

  // Clean up resources
  void dispose() {
    _connectivityTimer?.cancel();
    _blogsChannel?.unsubscribe();
    _blogsChannel = null;
    _localDb.close();
  }
} 