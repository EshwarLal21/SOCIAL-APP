import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' show ClientException;

class BlogRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  RealtimeChannel? _blogsChannel;
  bool _isSubscribed = false;
  Timer? _connectivityTimer;

  BlogRepository() {
    // Periodically try to reconnect
    _connectivityTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!_isSubscribed) {
        _setupRealtimeSubscription();
      }
    });
  }

  Future<List<Map<String, dynamic>>> getBlogs() async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return [];

      try {
        // Set up realtime subscription if not already subscribed
        _setupRealtimeSubscription();

        // Get user's following list from Supabase
        final followingResponse = await _supabase
            .from('following')
            .select('followed_id')
            .eq('follower_id', currentUserId);
        final followingIds = followingResponse.map((f) => f['followed_id']).toList();

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
              return [];
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
            return [];
          }
        }

        // Combine blogs
        final allBlogs = [...followingBlogs, ...randomBlogs];
        return allBlogs;
      } catch (e) {
        print('Error syncing with server: $e');
        if (_isNetworkError(e)) {
          _handleOfflineMode();
        }
        return [];
      }
    } catch (e) {
      print('Error in getBlogs: $e');
      _handleOfflineMode();
      return [];
    }
  }

  bool _isNetworkError(dynamic error) {
    return error is ClientException ||
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

  // Clean up resources
  void dispose() {
    _connectivityTimer?.cancel();
    _blogsChannel?.unsubscribe();
    _blogsChannel = null;
  }
}