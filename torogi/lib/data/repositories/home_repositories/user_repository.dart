import 'dart:io';
import 'package:drift/drift.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../local/database/app_database.dart';

class UserRepository {
  final _client = Supabase.instance.client;
  final AppDatabase _localDb;

  UserRepository(this._localDb);

  Future<List<Map<String, dynamic>>> fetchFeaturedUsers(String currentUserId) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {
        // Device is offline — fetch users from local Drift database
        final localUsers = await _localDb.select(_localDb.localUsers).get();

        return localUsers.map((user) => {
          'id': user.id,
          'username': user.username,
          'profilePic': user.profilepic,
          'followers': user.followers,
        }).toList();
      }

      // Device is online — fetch from Supabase
      if (currentUserId.isEmpty) {
        final response = await _client
            .from('users')
            .select('id, username, profilePic, followers')
            .order('followers', ascending: false)
            .limit(10);

        // cache them locally in Drift for offline use
        await _cacheFeaturedUsers(response);

        return List<Map<String, dynamic>>.from(response);
      }

      final response = await _client.rpc('get_friends_of_friends', params: {
        'user_id': currentUserId,
      });

      if (response == null || response.isEmpty) {
        final fallback = await _client
            .from('users')
            .select('id, username, profilePic, followers')
            .order('followers', ascending: false)
            .limit(10);

        await _cacheFeaturedUsers(fallback);

        return List<Map<String, dynamic>>.from(fallback);
      }

      await _cacheFeaturedUsers(response);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to load users: ${e.toString()}");
      rethrow;
    }
  }

  Future<void> _cacheFeaturedUsers(List<dynamic> users) async {
    // clear old cache
    await _localDb.delete(_localDb.localUsers).go();

    for (var user in users) {
      await _localDb.into(_localDb.localUsers).insertOnConflictUpdate(
        LocalUsersCompanion.insert(
          id: user['id'],
          username: user['username'],
          email: user['email'] ?? '', // <-- add this line
          profilepic: Value(user['profilePic'] ?? ''),
          followers: Value(user['followers'] ?? 0),
        ),
      );
    }
  }
}
