import 'dart:async';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show ClientException;

class UserRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  bool _isOffline = false;

  /// Fetch current user profile
  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return null;

      final userData = await _supabase
          .from('users')
          .select()
          .eq('id', currentUserId)
          .single();

      return userData;
    } catch (e) {
      print('Error in getCurrentUser: $e');
      return null;
    }
  }

  /// Fetch a user's profile
  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    try {
      final userData = await _supabase
          .from('users')
          .select()
          .eq('id', userId)
          .single();

      return userData;
    } catch (e) {
      print('Error in getUserProfile: $e');
      return null;
    }
  }

  /// Update current user profile
  Future<bool> updateUserProfile(Map<String, dynamic> userData) async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return false;

      await _supabase.from('users').update(userData).eq('id', currentUserId);
      return true;
    } catch (e) {
      print('Error in updateUserProfile: $e');
      return false;
    }
  }

  /// Get followers count
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

  /// Get following count
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

  /// Get followers list
  Future<List<Map<String, dynamic>>> getFollowers(String userId) async {
    try {
      final response = await _supabase
          .from('follows')
          .select('''
            follower_id,
            users:follower_id (
              id, email, username, bio, profilepic, banner, location
            )
          ''')
          .eq('followed_id', userId);

      return (response as List)
          .map((item) => item['users'] as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error getting followers: $e');
      return [];
    }
  }

  /// Get following list
  Future<List<Map<String, dynamic>>> getFollowing(String userId) async {
    try {
      final response = await _supabase
          .from('follows')
          .select('''
            followed_id,
            users:followed_id (
              id, email, username, bio, profilepic, banner, location
            )
          ''')
          .eq('follower_id', userId);

      return (response as List)
          .map((item) => item['users'] as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error getting following: $e');
      return [];
    }
  }

  /// Follow a user
  Future<bool> followUser(String userIdToFollow) async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return false;

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

  /// Unfollow a user
  Future<bool> unfollowUser(String userIdToUnfollow) async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return false;

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

  /// Check if following a user
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

  /// Connection check helper (optional)
  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
