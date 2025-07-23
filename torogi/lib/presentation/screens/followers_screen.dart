import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../data/repositories/user_repository.dart';

class FollowersScreen extends StatefulWidget {
  final String userId;
  final bool showFollowers; // true for followers, false for following

  const FollowersScreen({
    Key? key,
    required this.userId,
    required this.showFollowers,
  }) : super(key: key);

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  final UserRepository _userRepository = UserRepository();
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = true;
  final currentUserId = Supabase.instance.client.auth.currentUser?.id;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() => _isLoading = true);
    try {
      final users = widget.showFollowers
          ? await _userRepository.getFollowers(widget.userId)
          : await _userRepository.getFollowing(widget.userId);
      setState(() => _users = users);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading ${widget.showFollowers ? 'followers' : 'following'}')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _removeFollower(String followerId) async {
    try {
      // For removing a follower, we need to call the RPC function directly
      await Supabase.instance.client.rpc(
        'handle_unfollow',
        params: {
          'follower': followerId,
          'followed': widget.userId,
        },
      );
      await _loadUsers(); // Refresh the list
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Follower removed successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error removing follower')),
        );
      }
    }
  }

  Future<void> _unfollowUser(String userId) async {
    try {
      await _userRepository.unfollowUser(userId);
      await _loadUsers(); // Refresh the list
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unfollowed successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error unfollowing user')),
        );
      }
    }
  }

  void _navigateToUserProfile(String userId) {
    if (userId == currentUserId) {
      context.go('/profile');
    } else {
      context.go('/profile/$userId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.showFollowers ? 'Followers' : 'Following'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _users.isEmpty
              ? Center(
                  child: Text(
                    'No ${widget.showFollowers ? 'followers' : 'following'} yet',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    final isCurrentUser = currentUserId == widget.userId;
                    
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: user['profilepic'] != null
                            ? NetworkImage(user['profilepic'])
                            : null,
                        child: user['profilepic'] == null
                            ? Text(user['username'][0].toUpperCase())
                            : null,
                      ),
                      title: Text(user['username']),
                      subtitle: user['location'] != null 
                          ? Text(user['location'])
                          : Text(user['bio'] ?? ''),
                      trailing: isCurrentUser
                          ? TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(widget.showFollowers
                                        ? 'Remove Follower?'
                                        : 'Unfollow User?'),
                                    content: Text(widget.showFollowers
                                        ? 'Are you sure you want to remove this follower?'
                                        : 'Are you sure you want to unfollow this user?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          if (widget.showFollowers) {
                                            _removeFollower(user['id']);
                                          } else {
                                            _unfollowUser(user['id']);
                                          }
                                        },
                                        child: Text(
                                          widget.showFollowers
                                              ? 'Remove'
                                              : 'Unfollow',
                                          style: const TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                widget.showFollowers ? 'Remove' : 'Unfollow',
                                style: const TextStyle(color: Colors.red),
                              ),
                            )
                          : null,
                      onTap: () => _navigateToUserProfile(user['id']),
                    );
                  },
                ),
    );
  }
} 