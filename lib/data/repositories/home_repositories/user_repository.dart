import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  final _client = Supabase.instance.client;

  Future<List<dynamic>> fetchFeaturedUsers(String currentUserId) async {
    try {
      if (currentUserId.isEmpty) {
        // Return popular users if not logged in
        final response = await _client
            .from('users')
            .select('id, username, profilePic, followers')
            .order('followers', ascending: false)
            .limit(10);
            
        return response;
      }

      // Get friends of friends
      final response = await _client.rpc('get_friends_of_friends', params: {
        'user_id': currentUserId,
      });

      if (response == null || response.isEmpty) {
        // Fallback to popular users if no friends of friends
        final fallback = await _client
            .from('users')
            .select('id, username, profilePic, followers')
            .order('followers', ascending: false)
            .limit(10);
            
        return fallback;
      }

      return response;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to load users: ${e.toString()}");
      rethrow;
    }
  }
}