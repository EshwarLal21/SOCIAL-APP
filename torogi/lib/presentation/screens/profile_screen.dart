import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/presentation/screens/chat_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _userProfile;
  bool _isLoading = true;
  bool _isFollowing = false;
  int _followersCount = 0;
  int _followingCount = 0;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _checkFollowStatus();
  }

  Future<void> _loadUserProfile() async {
    try {
      final response = await Supabase.instance.client
          .from('users')
          .select()
          .eq('id', widget.userId)
          .single();

      setState(() {
        _userProfile = response;
        _followersCount = response['followers'] ?? 0;
        _followingCount = response['following'] ?? 0;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading profile: $e', style: const TextStyle(color: Colors.white))),
        );
      }
    }
  }

  Future<void> _checkFollowStatus() async {
    try {
      final currentUserId = Supabase.instance.client.auth.currentUser?.id;
      if (currentUserId == null) return;

      final response = await Supabase.instance.client
          .from('follows')
          .select()
          .eq('follower_id', currentUserId)
          .eq('followed_id', widget.userId)
          .maybeSingle();

      setState(() {
        _isFollowing = response != null;
      });
    } catch (e) {
      debugPrint('Error checking follow status: $e');
    }
  }

  Future<void> _toggleFollow() async {
    try {
      final currentUserId = Supabase.instance.client.auth.currentUser?.id;
      if (currentUserId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please login to follow users', style: TextStyle(color: Colors.white))),
        );
        return;
      }

      if (_isFollowing) {
        await Supabase.instance.client.rpc(
          'handle_unfollow',
          params: {
            'follower': currentUserId,
            'followed': widget.userId,
          },
        );
        setState(() {
          _isFollowing = false;
          _followersCount--;
        });
      } else {
        await Supabase.instance.client.rpc(
          'handle_follow',
          params: {
            'follower': currentUserId,
            'followed': widget.userId,
          },
        );
        setState(() {
          _isFollowing = true;
          _followersCount++;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e', style: TextStyle(color: Colors.white))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white, // Fixed background color
        body: Center(child: CircularProgressIndicator(color: Colors.black)),
      );
    }

    if (_userProfile == null) {
      return const Scaffold(
        backgroundColor: Colors.white, // Fixed background color
        body: Center(child: Text('User not found', style: TextStyle(color: Colors.black, fontSize: 18))),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white, // Fixed background color
      appBar: AppBar(
        title: Text(
          _userProfile!['username'] ?? 'Profile',
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile picture
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[200],
              backgroundImage: _userProfile!['profilepic'] != null
                  ? NetworkImage(_userProfile!['profilepic'])
                  : null,
              child: _userProfile!['profilepic'] == null
                  ? Text(
                (_userProfile!['username'] as String)[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )
                  : null,
            ),
            const SizedBox(height: 16),

            // Username
            Text(
              _userProfile!['username'] ?? '',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Email (optional)
            if (_userProfile!['email'] != null) ...[
              const SizedBox(height: 6),
              Text(
                _userProfile!['email'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],

            // Bio
            if (_userProfile!['bio'] != null) ...[
              const SizedBox(height: 12),
              Text(
                _userProfile!['bio'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],

            const SizedBox(height: 24),

            // Follower stats
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatItem(_followersCount, 'Followers'),
                const SizedBox(width: 40),
                _buildStatItem(_followingCount, 'Following'),
              ],
            ),

            const SizedBox(height: 30),

            // Action buttons
            if (widget.userId != Supabase.instance.client.auth.currentUser?.id)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _toggleFollow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      _isFollowing ? Colors.grey[600] : Colors.blue[600],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _isFollowing ? 'Unfollow' : 'Follow',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            userId: widget.userId,
                            username: _userProfile!['username'],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.message, color: Colors.white),
                    label: const Text(
                      'Message',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(int count, String label) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}