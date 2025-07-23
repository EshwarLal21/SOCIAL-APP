import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/core/utils/snackbar_util.dart';
import 'package:torogi/features/profile/profile_bloc.dart';
import 'package:torogi/features/profile/profile_event.dart';
import 'package:torogi/features/profile/profile_state.dart';
import 'package:torogi/presentation/screens/edit_profile_screen.dart';
import 'package:torogi/presentation/screens/followers_screen.dart';
import 'package:torogi/presentation/screens/request_upgrade.dart';
import 'package:torogi/presentation/widgets/user_blogs_list.dart';

import '../../data/repositories/bookmark_repository.dart';
import '../widgets/bookmark_list.dart';

enum UserType { employer, serviceprovider }

class ProfileScreen extends StatefulWidget {
  final String? userId;

  const ProfileScreen({super.key, this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String profileUserId; // Use userId (UUID) instead of username
  late String profileUsername; // Store username separately

  @override
  void initState() {
    super.initState();
    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      debugPrint('ProfileScreen initState: No authenticated user');
      showSnackBar(context, 'Please log in to view profile', isError: true);
      context.go('/login');
      return;
    }
    profileUserId = currentUser.id; // Use UUID as userId
    profileUsername = currentUser.userMetadata?['username'] as String? ?? 'anonymous';
    if (profileUsername.isEmpty) {
      debugPrint('ProfileScreen initState: Username not found in metadata, using anonymous');
    }
    context.read<ProfileBloc>().add(LoadProfile(profileUserId)); // Pass userId
    _listenToProfileState();
  }

  void _listenToProfileState() {
    context.read<ProfileBloc>().stream.listen((state) {
      if (!mounted) return;
      if (state is ProfileError) {
        debugPrint('ProfileError: ${state.message}');
        showSnackBar(context, state.message, isError: true);
      }
    });
  }

  Color _getBannerColor(String? banner, Brightness brightness) {
    switch (banner?.toLowerCase()) {
      case 'gold':
        return brightness == Brightness.dark ? const Color(0xFFF0B300) : const Color(0xFF00D700);
      case 'silver':
        return brightness == Brightness.dark ? const Color(0xFFAAAAAA) : const Color(0xFFC0C0C0);
      case 'bronze':
        return brightness == Brightness.dark ? const Color(0xFF8B5A2B) : const Color(0xFFCD7F32);
      default:
        return brightness == Brightness.dark ? Colors.green[800]! : Colors.green[600]!;
    }
  }

  Widget _buildStatItem(String value, String label, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showSwitchAccountTypeDialog(BuildContext context, String username) {
    final state = context.read<ProfileBloc>().state;
    String currentUserType = 'employer';
    if (state is ProfileLoaded) {
      currentUserType = state.user['usertype']?.toLowerCase() ?? 'employer';
    }

    final targetUserType = currentUserType == 'employer' ? 'ServiceProvider' : 'Employer';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpgradeRequestScreen(
          initialUserType: targetUserType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(child: CircularProgressIndicator(color: colorScheme.primary));
          }

          if (state is ProfileLoaded) {
            final bannerColor = _getBannerColor(state.user['banner'], theme.brightness);
            final isOwnProfile = widget.userId == null || widget.userId == profileUserId;
            final usertype = UserType.values.firstWhere(
                  (e) => e.toString().split('.').last == state.user['usertype']?.toLowerCase(),
              orElse: () => UserType.employer,
            );

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 70,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        color: bannerColor,
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              state.user['username'] ?? 'Anonymous',
                              style: theme.textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w800,
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          if (isOwnProfile)
                            IconButton(
                              icon: Icon(Icons.logout, color: colorScheme.onPrimary),
                              onPressed: () {
                                context.read<ProfileBloc>().add(LogoutRequested(context));
                                context.read<ProfileBloc>().add(ResetProfile());
                                context.go('/login');
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  pinned: true,
                  backgroundColor: bannerColor,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 42,
                                  backgroundColor: colorScheme.surfaceContainer,
                                  backgroundImage: state.user['profilepic'] != null
                                      ? NetworkImage(state.user['profilepic'])
                                      : null,
                                  child: state.user['profilepic'] == null
                                      ? Icon(Icons.person, size: 40, color: colorScheme.onSurfaceVariant)
                                      : null,
                                ),
                                const SizedBox(height: 8),
                                if (state.user['banner'] != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: bannerColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      state.user['banner'].toString().toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: bannerColor,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildStatItem(state.blogs.length.toString(), 'Blogs'),
                                  _buildStatItem(
                                    state.user['followers']?.toString() ?? '0',
                                    'Followers',
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FollowersScreen(
                                          userId: profileUserId, // Use userId (UUID)
                                          showFollowers: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildStatItem(
                                    state.user['following']?.toString() ?? '0',
                                    'Following',
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FollowersScreen(
                                          userId: profileUserId, // Use userId (UUID)
                                          showFollowers: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.user['name'] ?? state.user['username'] ?? 'Anonymous',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (state.user['usertype'] != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              state.user['usertype'].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        const SizedBox(height: 12),
                        if (state.user['bio'] != null &&
                            state.user['bio'].toString().trim().isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              state.user['bio'],
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        const SizedBox(height: 12),
                        if (state.user['location'] != null &&
                            state.user['location'].toString().trim().isNotEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 18, color: colorScheme.onSurfaceVariant),
                              const SizedBox(width: 4),
                              Text(
                                state.user['location'],
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: isOwnProfile
                                    ? () {
                                  final currentBloc = context.read<ProfileBloc>();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider<ProfileBloc>.value(
                                              value: currentBloc),
                                        ],
                                        child: EditProfileScreen(user: state.user),
                                      ),
                                    ),
                                  );
                                }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  elevation: 2,
                                ),
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  showSnackBar(
                                      context, 'Share profile functionality not implemented yet');
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: colorScheme.primary,
                                  side: BorderSide(
                                      color: colorScheme.primary, width: 1.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Text(
                                  'Share Profile',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (isOwnProfile)
                          ElevatedButton.icon(
                            onPressed: () => _showSwitchAccountTypeDialog(context, profileUsername),
                            icon: Icon(
                              Icons.swap_horiz,
                              color: colorScheme.onPrimary,
                            ),
                            label: Text(
                              'Switch to ${usertype == UserType.employer ? 'Service Provider' : 'Employer'}',
                              style: TextStyle(color: colorScheme.onPrimary),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.secondary,
                              foregroundColor: colorScheme.onSecondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              minimumSize: const Size(double.infinity, 48),
                              elevation: 2,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            indicatorColor: colorScheme.primary,
                            labelColor: colorScheme.primary,
                            unselectedLabelColor: colorScheme.onSurfaceVariant,
                            tabs: const [
                              Tab(text: 'My Blogs'),
                              Tab(text: 'Bookmarks'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: TabBarView(
                              children: [
                                // My Blogs
                                state.blogs.isEmpty
                                    ? Center(
                                  child: Text(
                                    'No blogs yet — create your first one!',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                )
                                    : UserBlogsList(userId: profileUserId),

                                // Bookmarked Blogs
                                BookmarkedBlogsList(
                                  bookmarkRepo: BookmarkRepository(), userId:  profileUserId,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is ProfileError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(LoadProfile(profileUserId));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}