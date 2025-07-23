import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'comments_sheet.dart';

class UserBlogsList extends StatefulWidget {
  final String userId;

  const UserBlogsList({super.key, required this.userId});

  @override
  State<UserBlogsList> createState() => _UserBlogsListState();
}

class _UserBlogsListState extends State<UserBlogsList> {
  List<Map<String, dynamic>> blogs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserBlogs();
  }

  Future<void> _fetchUserBlogs() async {
    final supabase = Supabase.instance.client;
    final currentUserId = supabase.auth.currentUser?.id;

    try {
      // Fetch user's blogs with user info
      final response = await supabase
          .from('blogs')
          .select('''
            *,
            users:userid (
              username,
              profilepic
            )
          ''')
          .eq('userid', widget.userId)
          .order('createdat', ascending: false);

      blogs = List<Map<String, dynamic>>.from(response);

      // For each blog, fetch likes and comments count
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
          }
        } catch (e) {
          blog['likes_count'] = 0;
          blog['is_liked'] = false;
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
      print('Error fetching user blogs: $e');
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

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (blogs.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("No blogs posted yet."),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        final likesCount = blog['likes_count'] ?? 0;
        final commentsCount = blog['comments_count'] ?? 0;
        final isLiked = blog['is_liked'] ?? false;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blog['image'] != null && blog['image'].toString().isNotEmpty)
                Image.network(
                  blog['image'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog['title'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(blog['description']),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : null,
                      ),
                      onPressed: () => _toggleLike(blog['id']),
                    ),
                    Text('$likesCount'),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline),
                      onPressed: () => _showComments(blog['id'], blog['title']),
                    ),
                    Text('$commentsCount'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}