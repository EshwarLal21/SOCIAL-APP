import 'dart:math';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/features/profile/profile_bloc.dart';
import 'package:torogi/features/profile/profile_event.dart';
import 'package:torogi/presentation/screens/profile.dart';
import 'comments_sheet.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BlogList extends StatefulWidget {
  final String category;

  const BlogList({super.key, required this.category});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<Map<String, dynamic>> blogs = [];
  bool isLoading = true;
  Map<String, bool> followingStatus = {};

  @override
  void initState() {
    super.initState();
    _fetchBlogs();
  }

  @override
  void didUpdateWidget(BlogList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      setState(() {
        isLoading = true;
      });
      _fetchBlogs();
    }
  }

  Future<void> _fetchBlogs() async {
    final supabase = Supabase.instance.client;
    final currentUserId = supabase.auth.currentUser?.id;

    try {
      var query = '''
        *,
        users:userid (
          username,
          profilepic
        )
      ''';

      final response = widget.category.toLowerCase() == 'all'
          ? await supabase
              .from('blogs')
              .select(query)
              .order('createdat', ascending: false)
              .limit(10)
          : await supabase
        .from('blogs')
              .select(query)
              .eq('category', widget.category.toLowerCase())
              .order('createdat', ascending: false)
        .limit(10);

      blogs = List<Map<String, dynamic>>.from(response);

      // For each blog, fetch likes, comments, and following status
      for (var blog in blogs) {
        try {
          // Get likes count
          final likes = await supabase
              .from('blog_likes')
              .select()
              .eq('blog_id', blog['id']);
          
          blog['likes_count'] = likes.length;

          // Check if current user liked this blog
          if (currentUserId != null) {
            final userLike = await supabase
                .from('blog_likes')
                .select()
                .eq('blog_id', blog['id'])
                .eq('user_id', currentUserId)
                .maybeSingle();
            
            blog['is_liked'] = userLike != null;

            // Check if current user is following the blog author
            if (blog['userid'] != currentUserId) {
              final following = await supabase
                  .from('follows')
                  .select()
                  .eq('follower_id', currentUserId)
                  .eq('followed_id', blog['userid'])
                  .maybeSingle();
              
              followingStatus[blog['userid']] = following != null;
            }
          }
        } catch (e) {
          blog['likes_count'] = 0;
          blog['is_liked'] = false;
          followingStatus[blog['userid']] = false;
        }

        try {
          // Get comments count
          final comments = await supabase
              .from('comments')
              .select()
              .eq('blogid', blog['id']);
          
          blog['comments_count'] = comments.length;
        } catch (e) {
          blog['comments_count'] = 0;
        }
      }

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching blogs: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _toggleLike(String blogId) async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;
      
      if (userId == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please login to like posts')),
          );
        }
        return;
      }

      // Check if already liked
      final likes = await supabase
          .from('blog_likes')
          .select()
          .eq('blog_id', blogId)
          .eq('user_id', userId);

      if (likes.isEmpty) {
        // Like the post
        await supabase
            .from('blog_likes')
            .insert({
              'blog_id': blogId,
              'user_id': userId,
            });

        if (mounted) {
          setState(() {
            final blogIndex = blogs.indexWhere((blog) => blog['id'] == blogId);
            if (blogIndex != -1) {
              blogs[blogIndex]['is_liked'] = true;
              blogs[blogIndex]['likes_count'] = (blogs[blogIndex]['likes_count'] ?? 0) + 1;
            }
          });
        }
      } else {
        // Unlike the post
        await supabase
            .from('blog_likes')
            .delete()
            .eq('blog_id', blogId)
            .eq('user_id', userId);

        if (mounted) {
          setState(() {
            final blogIndex = blogs.indexWhere((blog) => blog['id'] == blogId);
            if (blogIndex != -1) {
              blogs[blogIndex]['is_liked'] = false;
              blogs[blogIndex]['likes_count'] = (blogs[blogIndex]['likes_count'] ?? 1) - 1;
            }
          });
        }
      }
    } catch (e) {
      print('Error toggling like: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _toggleFollow(String userId) async {
    final supabase = Supabase.instance.client;
    final currentUserId = supabase.auth.currentUser?.id;

    if (currentUserId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please login to follow users')),
        );
      }
      return;
    }

    try {
      final isFollowing = followingStatus[userId] ?? false;

      if (isFollowing) {
        // Unfollow using the new function
        await supabase.rpc(
          'handle_unfollow',
          params: {
            'follower': currentUserId,
            'followed': userId,
          },
        );
      } else {
        // Follow using the new function
        await supabase.rpc(
          'handle_follow',
          params: {
            'follower': currentUserId,
            'followed': userId,
          },
        );
      }

      // Update local state
      if (mounted) {
        setState(() {
          followingStatus[userId] = !isFollowing;
        });
      }

      // Refresh profiles through ProfileBloc
      if (context.mounted) {
        try {
          context.read<ProfileBloc>().add(
                ToggleFollow(
                  currentUserId,
                  userId,
                ),
              );
        } catch (e) {
          print('Error refreshing profiles: $e');
        }
      }
    } catch (e) {
      print('Error toggling follow: $e');
      if (mounted) {
        // Show a more user-friendly error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString().contains('duplicate key value') 
                ? 'You are already following this user'
                : 'Error updating follow status. Please try again.',
            ),
          ),
        );
      }
    }
  }

  void _showComments(String blogId, String blogTitle) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) => CommentsSheet(blogId: blogId, title: blogTitle),
      ),
    );
  }

  List<Widget> _buildBlogItems(List<Map<String, dynamic>> blogs, BuildContext context) {
    List<Widget> items = [];
    final random = Random();
    final currentUserId = Supabase.instance.client.auth.currentUser?.id;

    // Pick 2 unique random positions for ads
    final adIndexes = <int>{};
    while (adIndexes.length < 2 && adIndexes.length < blogs.length) {
      adIndexes.add(random.nextInt(blogs.length));
    }

    for (int i = 0; i < blogs.length; i++) {
      if (adIndexes.contains(i)) {
        items.add(_buildAdPlaceholder());
      }

      final blog = blogs[i];
      final likesCount = blog['likes_count'] ?? 0;
      final commentsCount = blog['comments_count'] ?? 0;
      final isLiked = blog['is_liked'] ?? false;
      final isFollowing = followingStatus[blog['userid']] ?? false;
      final isCurrentUser = blog['userid'] == currentUserId;

      items.add(Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: blog['users']?['profilepic'] != null && blog['users']['profilepic'].toString().isNotEmpty
                    ? NetworkImage(blog['users']['profilepic'])
                    : null,
                child: blog['users']?['profilepic'] == null || blog['users']['profilepic'].toString().isEmpty
                    ? const Icon(Icons.person)
                    : null,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    blog['users']?['username'] ?? 'Anonymous',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (!isCurrentUser)
                    TextButton(
                      onPressed: () => _toggleFollow(blog['userid']),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        minimumSize: const Size(80, 30),
                        backgroundColor: isFollowing ? Colors.grey[200] : Colors.blue,
                        foregroundColor: isFollowing ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        isFollowing ? 'Following' : 'Follow',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
              subtitle: Text(blog['title'], style: Theme.of(context).textTheme.titleMedium),
            ),
            if (blog['image'] != null && blog['image'].toString().isNotEmpty)
              Container(
                height: 200, // Fixed height for all images
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Placeholder color
                ),
                child: Image.network(
                  blog['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: () => _toggleLike(blog['id']),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () => _showComments(blog['id'], blog['title']),
                  ),
                ],
              ),
            ),
            if (likesCount > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '$likesCount ${likesCount == 1 ? 'like' : 'likes'}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(blog['description']),
            ),
            if (commentsCount > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextButton(
                  onPressed: () => _showComments(blog['id'], blog['title']),
                  child: Text(
                    'View all $commentsCount comments',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ),
          ],
        ),
      ));
    }

    return items;
  }

  Widget _buildAdPlaceholder() {
    return _RewardedAdPlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

    if (blogs.isEmpty) {
      return const Center(
        child: Padding(
            padding: EdgeInsets.all(16.0),
          child: Text("No blogs found in this category."),
        ),
          );
        }

        final items = _buildBlogItems(blogs, context);
        return Column(children: items);
  }
}

class _RewardedAdPlaceholder extends StatefulWidget {
  @override
  State<_RewardedAdPlaceholder> createState() => _RewardedAdPlaceholderState();
}

class _RewardedAdPlaceholderState extends State<_RewardedAdPlaceholder> {
  RewardedAd? _rewardedAd;
  bool _isAdLoaded = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    setState(() {
      _isLoading = true;
    });
    RewardedAd.load(
      adUnitId: 'ca-app-pub-4286938835169204/9915562586',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _rewardedAd = ad;
            _isAdLoaded = true;
            _isLoading = false;
          });
        },
        onAdFailedToLoad: (error) {
          setState(() {
            _isAdLoaded = false;
            _isLoading = false;
          });
        },
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) return;
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _loadRewardedAd();
      },
    );
    _rewardedAd!.show(
      onUserEarnedReward: (_, reward) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You earned 24${reward.amount} ${reward.type}')),
        );
      },
    );
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: _isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: _isAdLoaded ? _showRewardedAd : null,
              child: Text(_isAdLoaded ? "Watch Ad" : "Loading Ad..."),
            ),
    );
  }
}