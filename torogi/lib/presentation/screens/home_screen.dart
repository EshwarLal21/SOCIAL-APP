import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../widgets/ad_widgets.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _featuredUsers = [];
  List<Map<String, dynamic>> _featuredServices = [];
  List<Map<String, dynamic>> _blogs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFeaturedUsers();
    _loadFeaturedServices();
    _loadBlogs();
  }

  Future<void> _loadBlogs() async {
    try {
      final response = await _supabase
          .from('blogs')
          .select()
          .order('created_at', ascending: false);

      if (mounted) {
        setState(() {
          _blogs = List<Map<String, dynamic>>.from(response);
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading blogs: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadFeaturedUsers() async {
    try {
      final response = await _supabase
          .from('users')
          .select()
          .order('created_at', ascending: false)
          .limit(5);

      if (mounted) {
        setState(() {
          _featuredUsers = List<Map<String, dynamic>>.from(response);
        });
      }
    } catch (e) {
      debugPrint('Error loading featured users: $e');
    }
  }

  Future<void> _loadFeaturedServices() async {
    try {
      final response = await _supabase
          .from('services')
          .select()
          .order('created_at', ascending: false)
          .limit(5);

      if (mounted) {
        setState(() {
          _featuredServices = List<Map<String, dynamic>>.from(response);
        });
      }
    } catch (e) {
      debugPrint('Error loading featured services: $e');
    }
  }

  Widget _buildBlogs() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_blogs.isEmpty) {
      return const Center(child: Text('No blogs available'));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _blogs.length + (_blogs.length ~/ 2),
      itemBuilder: (context, index) {
        if (index > 0 && index % 3 == 0) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: NativeAdWidget(),
          );
        }

        final blogIndex = index - (index ~/ 3);
        if (blogIndex >= _blogs.length) {
          return const SizedBox.shrink();
        }

        final blog = _blogs[blogIndex];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blog['image_url'] != null && blog['image_url'].isNotEmpty)
                Image.network(
                  blog['image_url']!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog['title']?.toString() ?? 'Untitled',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      blog['content']?.toString() ?? 'No content',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          timeago.format(
                            DateTime.parse(blog['created_at']?.toString() ?? DateTime.now().toIso8601String()),
                            allowFromNow: true,
                          ),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        RewardedAdWidget(
                          onRewarded: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Ad watched!')),
                            );
                          },
                          child: const Text('Watch Ad for More'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child : Column(
          children: [
            const AdBannerWidget(),
            _buildFeaturedUsers(),
            _buildFeaturedServices(),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Latest Posts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildBlogs(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedUsers() {
    if (_featuredUsers.isEmpty) {
      return const SizedBox(
        height: 120,
        child: Center(child: Text('No featured users available')),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'New Users',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: _featuredUsers.length,
            itemBuilder: (context, index) {
              final user = _featuredUsers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: user['id']?.toString() ?? '',
                  );
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        child: Text(
                          user['username']?.toString()[0].toUpperCase() ?? 'U',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        user['username']?.toString() ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
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
        ),
      ],
    );
  }

  Widget _buildFeaturedServices() {
    if (_featuredServices.isEmpty) {
      return const SizedBox(
        child: Center(child: Text('No featured services available')),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'New Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _featuredServices.length,
          itemBuilder: (context, index) {
            final service = _featuredServices[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/service-details',
                  arguments: service['id']?.toString() ?? '',
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service['title']?.toString() ?? 'Untitled',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        service['description']?.toString() ?? 'No description',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${service['price']?.toString() ?? '0'}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3797EF),
                            ),
                          ),
                          Text(
                            timeago.format(
                              DateTime.parse(service['created_at']?.toString() ?? DateTime.now().toIso8601String()).toLocal(),
                              allowFromNow: true,
                            ),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}