import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

import '../../data/local/database/app_database.dart';
import '../screens/profile_screen.dart';

class UserList extends StatefulWidget {
  final String currentUserId;
  final AppDatabase database;

  const UserList({
    super.key,
    required this.currentUserId,
    required this.database,
  });

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    // Trigger sync once when widget mounts
    Future.microtask(() => _syncUsersWithSupabase());
  }

  Future<void> _syncUsersWithSupabase() async {
    try {
      final supabase = Supabase.instance.client;

      final users = await supabase.from('users').select();

      for (final user in users) {
        await widget.database.into(widget.database.localUsers).insert(
          LocalUsersCompanion(
            id: drift.Value(user['id']),
            username: drift.Value(user['username']),
            email: drift.Value(user['email']),
            bio: drift.Value(user['bio']),
            location: drift.Value(user['location']),
            profilepic: drift.Value(user['profilepic']),
            banner: drift.Value(user['banner'] ?? 'guest'),
            usertype: drift.Value(user['usertype'] ?? 'guest'),
            following: drift.Value(user['following'] ?? 1),
            followers: drift.Value(user['followers'] ?? 0),
            createdAt: drift.Value(user['createdat'] != null
                ? DateTime.tryParse(user['createdat'])
                : null),
            themeMode: drift.Value(user['themeMode'] ?? 'system'),
            notificationsEnabled:
            drift.Value(user['notificationsEnabled'] ?? false),
            credits: drift.Value(user['credits'] ?? 0),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
      }
    } catch (e) {
      debugPrint('Error syncing users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LocalUser>>(
      stream: (widget.database.select(widget.database.localUsers)
        ..where((tbl) => tbl.id.isNotValue(widget.currentUserId)))
          .watch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final users = snapshot.data ?? [];
        if (users.isEmpty) {
          return const Center(
            child: Text('No featured users available.'),
          );
        }

        return SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(userId: user.id),
                    ),
                  );
                },
                child: Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: user.profilepic != null
                            ? (user.profilepic!.startsWith('http')
                            ? NetworkImage(user.profilepic!)
                            : FileImage(File(user.profilepic!))
                        as ImageProvider)
                            : const AssetImage('assets/default_profile.png'),
                        onBackgroundImageError: (error, stackTrace) {
                          debugPrint('Error loading profile image: $error');
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        user.username,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        user.usertype,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
