import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserList extends StatelessWidget {
  final String currentUserId;

  const UserList({super.key, required this.currentUserId});

  Future<List<dynamic>> _fetchUsers() async {
    final client = Supabase.instance.client;

    // Try fetching friends of friends
    final response = await client
        .rpc('get_friends_of_friends', params: {'user_id': currentUserId});

    final friendsOfFriends = response as List<dynamic>?;

    // If no friends-of-friends, fallback to most followed users
    if (friendsOfFriends == null || friendsOfFriends.isEmpty) {
      final fallback = await client
          .from('users')
          .select('id, username, profilePic, followers')
          .order('followers', ascending: false)
          .limit(10);

      return fallback;
    }

    return friendsOfFriends;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }


        final users = snapshot.data as List<dynamic>?;

        if (users == null || users.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("No users found."),
          );
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading users'));
        }


        

        return SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user['profilePic'] ?? ''),
                      radius: 30,
                    ),
                    const SizedBox(height: 6),
                    Text(user['username'] ?? ''),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}