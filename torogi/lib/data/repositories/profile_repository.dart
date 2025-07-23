import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class ProfileRepository {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> upgradeBannerTo(String userId, String targetBanner) async {
    final user = await fetchUserProfile(userId);
    final currentBanner = user['banner'];
    final credits = user['credits'] ?? 0;

    int requiredCredits;
    if (currentBanner == 'guest') {
      throw Exception('Guest users cannot upgrade banners.');
    }

    if (targetBanner == 'silver' && currentBanner != 'bronze') {
      throw Exception('Only Bronze users can upgrade to Silver.');
    } else if (targetBanner == 'gold' && currentBanner != 'silver') {
      throw Exception('Only Silver users can upgrade to Gold.');
    }

    requiredCredits = 2;

    if (credits < requiredCredits) {
      throw Exception('You need $requiredCredits credits to upgrade.');
    }

    await _client.from('users').update({
      'banner': targetBanner,
      'credits': credits - requiredCredits,
    }).eq('id', userId);
  }

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

  Future<void> updateProfile({
    required String userId,
    String? name,
    String? bio,
    String? location,
    String? banner,
    String? userType,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (name != null && name.isNotEmpty) updates['username'] = name;
      if (bio != null) updates['bio'] = bio;
      if (location != null) updates['location'] = location;
      if (banner != null) updates['banner'] = banner;
      if (userType != null) updates['usertype'] = userType;

      if (updates.isNotEmpty) {
        await _client.from('users').update(updates).eq('id', userId);
      }
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  Future<void> addCredits(String userId, int creditsToAdd) async {
    try {
      final user = await fetchUserProfile(userId);
      final currentCredits = user['credits'] ?? 0;

      await _client.from('users').update({
        'credits': currentCredits + creditsToAdd,
      }).eq('id', userId);

      debugPrint('✅ Added $creditsToAdd credits to $userId');
    } catch (e) {
      debugPrint('❌ Failed to add credits: $e');
      throw Exception('Could not add credits: $e');
    }
  }

  Future<void> requestUserTypeUpgrade({
    required String userId,
    required String targetUserType,
  }) async {
    try {
      final existingRequests = await _client
          .from('upgrade_requests')
          .select()
          .eq('user_id', userId)
          .eq('status', 'pending');

      if (existingRequests.isNotEmpty) {
        throw Exception('You already have a pending upgrade request.');
      }

      await _client.from('upgrade_requests').insert({
        'user_id': userId,
        'target_usertype': targetUserType,
        'status': 'pending',
        'created_at': DateTime.now().toIso8601String(),
      });

      debugPrint('✅ Upgrade request for $targetUserType submitted by $userId');
    } catch (e) {
      throw Exception('Failed to submit upgrade request: $e');
    }
  }

  Future<bool> hasPendingUpgradeRequest(String userId) async {
    final requests = await _client
        .from('upgrade_requests')
        .select()
        .eq('user_id', userId)
        .eq('status', 'pending');

    return requests.isNotEmpty;
  }

  Future<void> requestUserUpgrade({
    required String userId,
    required String requestType,
    required String requestedValue,
    required String businessId,
    required List<String> fileUrls,
  }) async {
    try {
      // Check for existing pending requests
      final existingRequests = await _client
          .from('upgrade_requests')
          .select()
          .eq('user_id', userId)
          .eq('requested_type', requestType)
          .eq('status', 'pending');

      if (existingRequests.isNotEmpty) {
        throw Exception('You already have a pending $requestType upgrade request.');
      }

      // Map requestedValue to requested_type based on requestType
      String mappedRequestedType;
      if (requestType == 'usertype') {
        mappedRequestedType = requestedValue.toLowerCase() == 'employer' ? 'employer' : 'serviceprovider';
      } else if (requestType == 'banner') {
        mappedRequestedType = requestedValue.toLowerCase(); // e.g., 'silver', 'gold'
      } else {
        throw Exception('Invalid request type: $requestType');
      }

      // Validate requestedValue
      if (requestType == 'usertype' &&
          !['Employer', 'ServiceProvider'].contains(requestedValue)) {
        throw Exception('Invalid user type: $requestedValue');
      } else if (requestType == 'banner' &&
          !['silver', 'gold'].contains(requestedValue)) {
        throw Exception('Invalid banner type: $requestedValue');
      }

      // Create new upgrade request
      await _client.from('upgrade_requests').insert({
        'user_id': userId,
        'requested_type': mappedRequestedType, // Use mapped value for constraint
        'requested_value': requestedValue, // Store user-friendly value
        'business_id': businessId,
        if (fileUrls.isNotEmpty) 'file_urls': fileUrls, // Only include if not empty
        'status': 'pending',
        'created_at': DateTime.now().toIso8601String(),
      });

      debugPrint('✅ Submitted $requestType upgrade request for $requestedValue by user: $userId');
    } catch (e) {
      debugPrint('❌ Failed to submit upgrade request: $e');
      throw Exception('Failed to submit upgrade request: $e');
    }
  }

  Future<String> uploadProfilePicture(String userId, File imageFile) async {
    try {
      final fileExt = imageFile.path.split('.').last;
      final fileName = '$userId.$fileExt';

      try {
        final existingFiles = await _client.storage.from('avatars').list();
        for (var file in existingFiles) {
          if (file.name.startsWith('$userId.')) {
            await _client.storage.from('avatars').remove([file.name]);
            break;
          }
        }
      } catch (e) {
        // Ignore errors when trying to remove old file
      }

      await _client.storage.from('avatars').upload(
        fileName,
        imageFile,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: true,
        ),
      );

      final imageUrl = _client.storage
          .from('avatars')
          .getPublicUrl(fileName) +
          '?t=${DateTime.now().millisecondsSinceEpoch}';

      await _client.from('users').update({'profilepic': imageUrl}).eq('id', userId);

      return imageUrl;
    } catch (e) {
      throw Exception('Failed to upload profile picture: $e');
    }
  }
  Future<List<Map<String, dynamic>>> fetchPendingUpgradeRequests() async {
    final response = await _client
        .from('upgrade_requests')
        .select('id, user_id, requested_value, status, created_at, file_urls')
        .eq('status', 'pending')
        .order('created_at', ascending: false);

    final List<Map<String, dynamic>> requests = List<Map<String, dynamic>>.from(response);

    for (var request in requests) {
      final userResponse = await _client
          .from('users')
          .select('username')
          .eq('id', request['user_id'])
          .maybeSingle();

      request['username'] = userResponse != null ? userResponse['username'] : 'Unknown';
    }

    return requests;
  }
}