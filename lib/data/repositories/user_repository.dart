import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:drift/drift.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show ClientException;
import '../local/database/app_database.dart';

class UserRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final AppDatabase _localDb = AppDatabase();
  bool _isOffline = false;

  // Initialize with a default user for offline mode
  Future<void> initializeDefaultUser(String userId) async {
    try {
      final existingUser = await _localDb.getUser(userId);
      if (existingUser == null) {
        print('Creating default user entry for offline mode');
        await _localDb.insertUser(LocalUsersCompanion.insert(
          id: userId,
          email: 'offline@user.com',  // Default value
          username: 'Offline User',    // Default value
          fullName: const Value('Offline User'),
          bio: const Value(''),
          profilePic: const Value(null),
          coverPhoto: const Value(null),
          lastUpdated: DateTime.now(),
        ));
      }
    } catch (e) {
      print('Error initializing default user: $e');
    }
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      print('Getting current user...');
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) {
        print('No current user ID found');
        return null;
      }

      print('Checking local database for user: $currentUserId');
      final localUser = await _localDb.getUser(currentUserId);
      
      // If we don't have local data, initialize it
      if (localUser == null) {
        print('No local user found, initializing default');
        await initializeDefaultUser(currentUserId);
        return _getLocalUserData(await _localDb.getUser(currentUserId));
      }

      print('Found local user data');
      return _getLocalUserData(localUser);
    } catch (e) {
      print('Error in getCurrentUser: $e');
      _isOffline = true;
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    try {
      print('Getting user profile for ID: $userId');
      
      // First check local database
      print('Checking local database...');
      final localUser = await _localDb.getUser(userId);
      
      if (localUser != null) {
        print('Found user in local database');
        return _getLocalUserData(localUser);
      }

      // If we're offline and don't have local data, create a default entry
      if (_isOffline || !await _hasInternetConnection()) {
        print('Device is offline, creating default user entry');
        await initializeDefaultUser(userId);
        return _getLocalUserData(await _localDb.getUser(userId));
      }

      // Try online fetch only if we're not offline
      try {
        print('Attempting to fetch from server...');
        final userData = await _supabase
            .from('users')
            .select()
            .eq('id', userId)
            .single();

        if (userData != null) {
          print('Successfully fetched user data from server');
          await _updateLocalUser(userData);
          return userData;
        }
      } catch (e) {
        print('Error fetching from server: $e');
        _isOffline = true;
        
        // Create default user if we don't have any data
        await initializeDefaultUser(userId);
        return _getLocalUserData(await _localDb.getUser(userId));
      }

      return null;
    } catch (e) {
      print('Error in getUserProfile: $e');
      _isOffline = true;
      
      // Final fallback: create and return default user
      await initializeDefaultUser(userId);
      return _getLocalUserData(await _localDb.getUser(userId));
    }
  }

  Future<bool> updateUserProfile(Map<String, dynamic> userData) async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return false;

      print('Updating user profile...');
      // Always update local database first
      await _updateLocalUser({
        ...userData,
        'id': currentUserId,
      });
      print('Local database updated successfully');

      // Only try server update if we're online
      if (!_isOffline && await _hasInternetConnection()) {
        try {
          await _supabase
              .from('users')
              .update(userData)
              .eq('id', currentUserId);
          print('Server update successful');
        } catch (e) {
          print('Error updating server profile (continuing with local update): $e');
          _isOffline = true;
        }
      } else {
        print('Skipping server update (offline mode)');
        _isOffline = true;
      }

      return true;
    } catch (e) {
      print('Error in updateUserProfile: $e');
      _isOffline = true;
      return false;
    }
  }

  Future<void> _updateLocalUser(Map<String, dynamic> userData) async {
    try {
      print('Updating local user data...');
      await _localDb.insertUser(LocalUsersCompanion.insert(
        id: userData['id'],
        email: userData['email'] ?? 'offline@user.com',
        username: userData['username'] ?? 'Offline User',
        fullName: Value(userData['fullname']),
        bio: Value(userData['bio']),
        profilePic: Value(userData['profilepic']),
        coverPhoto: Value(userData['coverphoto']),
        lastUpdated: DateTime.now(),
      ));
      print('Local user data updated successfully');
    } catch (e) {
      print('Error updating local user data: $e');
      rethrow;
    }
  }

  Map<String, dynamic>? _getLocalUserData(LocalUser? user) {
    if (user == null) {
      print('Warning: Attempted to get data for null user');
      return null;
    }

    print('Converting local user data to map');
    return {
      'id': user.id,
      'email': user.email,
      'username': user.username,
      'fullname': user.fullName ?? 'Offline User',
      'bio': user.bio ?? '',
      'profilepic': user.profilePic,
      'coverphoto': user.coverPhoto,
    };
  }

  bool _isNetworkError(dynamic error) {
    return error is SocketException ||
           error is ClientException ||
           error is TimeoutException ||
           (error.toString().contains('SocketException') ||
            error.toString().contains('Failed host lookup') ||
            error.toString().contains('nodename nor servname provided') ||
            error.toString().contains('Connection failed'));
  }

  Future<bool> _hasInternetConnection() async {
    if (_isOffline) {
      print('Already in offline mode, skipping connection check');
      return false;
    }

    try {
      print('Checking internet connection...');
      final response = await http.head(
        Uri.parse('https://jtdaxfuqpriywagqcuoa.supabase.co/rest/v1/'),
      ).timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          print('Connection check timed out');
          _isOffline = true;
          throw TimeoutException('Connection timed out');
        },
      );
      
      if (response.statusCode != 200) {
        print('Connection check failed: status code ${response.statusCode}');
        _isOffline = true;
        return false;
      }

      print('Connection check successful');
      _isOffline = false;
      return true;
    } catch (e) {
      print('Connection check failed: $e');
      _isOffline = true;
      return false;
    }
  }

  // Get followers count
  Future<int> getFollowersCount(String userId) async {
    try {
      final response = await _supabase
          .from('follows')
          .select('follower_id')
          .eq('followed_id', userId);
      
      return (response as List).length;
    } catch (e) {
      print('Error getting followers count: $e');
      return 0;
    }
  }

  // Get following count
  Future<int> getFollowingCount(String userId) async {
    try {
      final response = await _supabase
          .from('follows')
          .select('followed_id')
          .eq('follower_id', userId);
      
      return (response as List).length;
    } catch (e) {
      print('Error getting following count: $e');
      return 0;
    }
  }

  // Get followers list
  Future<List<Map<String, dynamic>>> getFollowers(String userId) async {
    try {
      final response = await _supabase
          .from('follows')
          .select('''
            follower_id,
            users:follower_id (
              id,
              email,
              username,
              bio,
              profilepic,
              banner,
              location
            )
          ''')
          .eq('followed_id', userId);

      return (response as List).map((item) => item['users'] as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error getting followers: $e');
      return [];
    }
  }

  // Get following list
  Future<List<Map<String, dynamic>>> getFollowing(String userId) async {
    try {
      final response = await _supabase
          .from('follows')
          .select('''
            followed_id,
            users:followed_id (
              id,
              email,
              username,
              bio,
              profilepic,
              banner,
              location
            )
          ''')
          .eq('follower_id', userId);

      return (response as List).map((item) => item['users'] as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error getting following: $e');
      return [];
    }
  }

  // Follow a user
  Future<bool> followUser(String userIdToFollow) async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return false;

      // Check if already following
      final existing = await _supabase
          .from('follows')
          .select()
          .eq('follower_id', currentUserId)
          .eq('followed_id', userIdToFollow)
          .maybeSingle();

      if (existing != null) {
        print('Already following this user');
        return true;
      }

      // Add new following relationship
      await _supabase.from('follows').insert({
        'follower_id': currentUserId,
        'followed_id': userIdToFollow,
      });

      return true;
    } catch (e) {
      print('Error following user: $e');
      return false;
    }
  }

  // Unfollow a user
  Future<bool> unfollowUser(String userIdToUnfollow) async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return false;

      // Remove following relationship
      await _supabase
          .from('follows')
          .delete()
          .eq('follower_id', currentUserId)
          .eq('followed_id', userIdToUnfollow);

      return true;
    } catch (e) {
      print('Error unfollowing user: $e');
      return false;
    }
  }

  // Check if following a user
  Future<bool> isFollowing(String userId) async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return false;

      final response = await _supabase
          .from('follows')
          .select()
          .eq('follower_id', currentUserId)
          .eq('followed_id', userId)
          .maybeSingle();

      return response != null;
    } catch (e) {
      print('Error checking following status: $e');
      return false;
    }
  }

  // Clean up resources
  void dispose() {
    print('Disposing UserRepository');
    _localDb.close();
  }
} 