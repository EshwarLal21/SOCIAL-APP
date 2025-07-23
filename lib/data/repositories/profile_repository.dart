import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class ProfileRepository {
  final SupabaseClient _client = Supabase.instance.client;

  // Upgrade user's banner
  Future<void> upgradeBanner({
    required String userId,
    required String currentBanner,
    required int currentCredits,
  }) async {
    try {
      String? newBanner;
      int requiredCredits = 0;

      if (currentBanner == 'guest') {
        throw Exception('Guest users cannot upgrade');
      } else if (currentBanner == 'bronze') {
        requiredCredits = 20;
        if (currentCredits < requiredCredits) {
          throw Exception('You need $requiredCredits credits to upgrade to Silver');
        }
        newBanner = 'silver';
      } else if (currentBanner == 'silver') {
        requiredCredits = 20;
        if (currentCredits < requiredCredits) {
          throw Exception('You need $requiredCredits credits to upgrade to Gold');
        }
        newBanner = 'gold';
      } else if (currentBanner == 'gold') {
        throw Exception('You already have the highest banner (Gold)');
      } else {
        throw Exception('Invalid banner type');
      }

      // Perform upgrade: deduct credits and update banner
      await _client.from('users').update({
        'banner': newBanner,
        'credits': currentCredits - requiredCredits,
      }).eq('id', userId);

    } catch (e) {
      throw Exception('Failed to upgrade banner: $e');
    }
  }


  Future<Map<String, dynamic>> fetchUserProfile(String userId) async {
    try {
    final response = await _client
        .from('users')
        .select()
        .eq('id', userId)
        .single();

    return response;
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchUserBlogs(String userId) async {
    try {
    final response = await _client
        .from('blogs')
        .select()
        .eq('userid', userId)
        .order('createdat', ascending: false);

    return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch user blogs: $e');
    }
  }

  Future<void> followUser(String followerId, String followedId) async {
    try {
      // Use the RPC function that handles both the follow relationship and count updates
      await _client.rpc(
        'handle_follow',
        params: {
          'follower': followerId,
          'followed': followedId,
        },
      );
    } catch (e) {
      if (e.toString().contains('duplicate key value')) {
        throw Exception('You are already following this user');
      }
      throw Exception('Failed to follow user: $e');
    }
  }

  Future<void> unfollowUser(String followerId, String followedId) async {
    try {
      // Use the RPC function that handles both the unfollow relationship and count updates
      await _client.rpc(
        'handle_unfollow',
        params: {
          'follower': followerId,
          'followed': followedId,
        },
      );
    } catch (e) {
      throw Exception('Failed to unfollow user: $e');
    }
  }

  Future<bool> checkIfFollowing(String followerId, String followedId) async {
    try {
    final response = await _client
        .from('follows')
        .select()
        .eq('follower_id', followerId)
        .eq('followed_id', followedId);

    return response.isNotEmpty;
    } catch (e) {
      throw Exception('Failed to check following status: $e');
    }
  }

  // Update user profile
  Future<void> updateProfile({
    required String userId,
    String? name,
    String? bio,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (bio != null) updates['bio'] = bio;
      // Only update name if it's provided and not empty
      if (name != null && name.isNotEmpty) updates['username'] = name;

      if (updates.isNotEmpty) {
        await _client
            .from('users')
            .update(updates)
            .eq('id', userId);
      }
    } catch (e) {
      print('Error updating profile: $e'); // For debugging
      throw Exception('Failed to update profile: $e');
    }
  }

  // Upload profile picture
  Future<String> uploadProfilePicture(String userId, File imageFile) async {
    try {
      final fileExt = imageFile.path.split('.').last;
      final fileName = '$userId.$fileExt';  // Simplified file name

      // Try to remove existing profile picture first
      try {
        final existingFiles = await _client.storage.from('avatars')
            .list();

        for (var file in existingFiles) {
          if (file.name.startsWith('$userId.')) {
            await _client.storage.from('avatars')
                .remove([file.name]);
            break;
          }
        }
      } catch (e) {
        // Ignore errors when trying to remove old file
      }

      // Upload the new file
      await _client.storage.from('avatars')
          .upload(
            fileName,  // Upload directly to bucket root
            imageFile,
            fileOptions: const FileOptions(
              cacheControl: '3600',
              upsert: true,
            ),
          );

      // Get the public URL with a timestamp to prevent caching
      final imageUrl = _client.storage.from('avatars')
          .getPublicUrl(fileName) + '?t=${DateTime.now().millisecondsSinceEpoch}';

      // Update the user profile with the new image URL
      await _client.from('users')
          .update({'profilepic': imageUrl})
          .eq('id', userId);

      return imageUrl;
    } catch (e) {
      throw Exception('Failed to upload profile picture: $e');
    }
  }
}