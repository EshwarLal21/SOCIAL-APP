import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/data/repositories/bookmark_repository.dart';
import 'package:torogi/presentation/screens/profile_screen.dart';

class BookmarkedBlogsList extends StatelessWidget {
  final BookmarkRepository bookmarkRepo;
  final String userId;

  const BookmarkedBlogsList({
    super.key,
    required this.bookmarkRepo,
    required this.userId,
  });

  Future<List<Map<String, dynamic>>> _fetchBlogs(List<String> blogIds) async {
    if (blogIds.isEmpty) return [];

    final result = await Supabase.instance.client
        .from('blogs')
        .select('*, users:users!blogs_userid_fkey(id, username, profilepic)')
        .inFilter('id', blogIds)
        .order('createdat', ascending: false);

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: bookmarkRepo.watchBookmarkedPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final bookmarkedPostIds = snapshot.data ?? [];

        if (bookmarkedPostIds.isEmpty) {
          return const Center(child: Text('No bookmarked blogs yet.'));
        }

        return FutureBuilder<List<Map<String, dynamic>>>(
          future: _fetchBlogs(bookmarkedPostIds),
          builder: (context, blogSnapshot) {
            if (blogSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (blogSnapshot.hasError) {
              return Center(child: Text('Error: ${blogSnapshot.error}'));
            }

            final blogs = blogSnapshot.data ?? [];

            if (blogs.isEmpty) {
              return const Center(child: Text('No matching blogs found.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final blog = blogs[index];
                final user = blog['users'] ?? {};
                final imageUrl = blog['image'] ?? '';
                final profilePic = user['profilepic'] ?? '';
                final username = user['username'] ?? 'Anonymous';

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(userId: blog['userid']),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: profilePic.isNotEmpty ? NetworkImage(profilePic) : null,
                            child: profilePic.isEmpty ? const Icon(Icons.person) : null,
                          ),
                        ),
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(userId: blog['userid']),
                              ),
                            );
                          },
                          child: Text(
                            username,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        subtitle: Text(
                          blog['title'] ?? 'Untitled',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.flag_outlined, color: Colors.red),
                          onPressed: () {
                            // optional: _showReportDialog(blog['id']);
                          },
                        ),
                      ),

                      if (imageUrl.isNotEmpty)
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.image_not_supported, size: 40),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),

                      // actions row
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {
                                // optional: _toggleLike(blog['id']);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.chat_bubble_outline),
                              onPressed: () {
                                // optional: _showComments(blog['id'], blog['title']);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.bookmark, color: Colors.blue),
                              onPressed: () {
                                // optional: _toggleBookmark(blog['id']);
                              },
                            ),
                          ],
                        ),
                      ),

                      // description
                      if (blog['description'] != null &&
                          blog['description'].toString().trim().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Text(blog['description'] ?? ''),
                        ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
