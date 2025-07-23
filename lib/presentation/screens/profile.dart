import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/features/profile/profile_bloc.dart';
import 'package:torogi/features/profile/profile_event.dart';
import 'package:torogi/features/profile/profile_state.dart';
import 'package:torogi/presentation/widgets/user_blogs_list.dart';
import 'package:torogi/presentation/screens/edit_profile_screen.dart';
import 'package:torogi/presentation/screens/followers_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/data/repositories/profile_repository.dart';

class ProfileScreen extends StatefulWidget {
  final String? userId;

  const ProfileScreen({super.key, this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String profileUserId;

  @override
  void initState() {
    super.initState();
    profileUserId = widget.userId ?? Supabase.instance.client.auth.currentUser!.id;
    context.read<ProfileBloc>().add(LoadProfile(profileUserId));
  }

  Widget _buildStatItem(String value, String label, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
        ),
        Text(
          label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileLoaded) {
            return Column(
              children: [
                // Top section with profile info
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 48, 16, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username and logout row
                      Row(
                  children: [
                          Text(
                            state.user['username'] ?? 'Anonymous',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          if (widget.userId == null)
                            IconButton(
                              icon: const Icon(Icons.logout, color: Colors.black),
                              onPressed: () {
                                context.read<ProfileBloc>().add(LogoutRequested(context));
                              },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Profile info row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          // Profile picture
                              Container(
                            width: 80,
                            height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                color: Colors.grey[300]!,
                                width: 0.5,
                                  ),
                                ),
                                child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              backgroundImage: state.user['profilepic'] != null
                                  ? NetworkImage(state.user['profilepic'])
                                          : null,
                              child: state.user['profilepic'] == null
                                  ? const Icon(Icons.person, size: 40, color: Colors.grey)
                                      : null,
                                ),
                              ),
                          const SizedBox(width: 24),
                          // Name and stats column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                  state.user['name'] ?? state.user['username'] ?? 'Anonymous',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                    ),
                                    const SizedBox(height: 12),
                                // Stats row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _buildStatItem(
                                      state.blogs.length.toString(),
                                                'Blogs',
                                    ),
                                            _buildStatItem(
                                      state.user['followers']?.toString() ?? '0',
                                                'Followers',
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FollowersScreen(
                                              userId: profileUserId,
                                              showFollowers: true,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                            _buildStatItem(
                                      state.user['following']?.toString() ?? '0',
                                                'Following',
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FollowersScreen(
                                              userId: profileUserId,
                                              showFollowers: false,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Bio
                      if (state.user['bio'] != null)
                        Text(
                          state.user['bio'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      const SizedBox(height: 12),
                      // Edit Profile / Share Profile buttons
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                              onPressed: () {
                                if (widget.userId == null) {
                                  final currentBloc = context.read<ProfileBloc>();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider<ProfileBloc>.value(
                                            value: currentBloc,
                                          ),
                                        ],
                                        child: EditProfileScreen(user: state.user),
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.grey, width: 0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: OutlinedButton(
                              onPressed: () {
                                // Handle share profile
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.grey, width: 0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                              child: const Text(
                                'Share Profile',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                            ),
                        ],
                      ),
                    ),
                const SizedBox(height: 10),
                const Divider(height: 0.5, color: Colors.grey),
                // Blogs section in Expanded to take remaining space
                Expanded(
                  child: state.blogs.isEmpty
                      ? const Center(
                              child: Text(
                                'Create your first blog',
                                style: TextStyle(
                              color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            )
                      : UserBlogsList(userId: profileUserId),
                ),
              ],
            );
          }
          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
            return const SizedBox();
          },
      ),
    );
  }
}
