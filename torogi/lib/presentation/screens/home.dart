import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/data/local/database/app_database.dart';
import 'package:torogi/presentation/widgets/blogs_list.dart';
import 'package:torogi/presentation/widgets/services_list.dart';
import 'package:torogi/presentation/widgets/users_list.dart';
import 'package:torogi/presentation/screens/create_blog.dart';
import 'package:torogi/features/services/services_repository.dart';
import 'package:torogi/presentation/screens/search_screen.dart';
import 'package:torogi/presentation/screens/service_details_screen.dart';
final AppDatabase database = AppDatabase();
enum HomeCategory {
  all, // Added 'all' category
  tech,
  culture,
  travel,
  sports,
  fashion,
  beauty,
  festivals,
  events,
  others
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeCategory _selectedCategory = HomeCategory.all; // Default to 'all'
  final ServicesRepository _servicesRepository = ServicesRepository();

  void _onMessagesTapped() {
    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please log in to access Messages.'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Log In',
            textColor: Colors.white,
            onPressed: () {
              context.go('/login');
            },
          ),
        ),
      );
      return;
    }
    context.go('/chats');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentUser = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.colorScheme.background,
            title: Image.asset(
              'assets/logo.png',
              height: 32,
            ),
            floating: true,
            snap: true,
            pinned: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
              ),
              if (currentUser != null)
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateBlogScreen(database: database)),
                    );
                  },
                ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  if (currentUser == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please log in to access your profile.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    context.go('/profile');
                  }
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryButtons(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Featured Users",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (currentUser != null)
                    UserList(currentUserId: currentUser.id, database: database,)
                  else
                    const Center(
                      child: Text("Login to view featured users."),
                    ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Featured Services",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFeaturedServices(theme),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Latest Blogs",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlogList(category: _selectedCategory.name), // Pass selected category
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: HomeCategory.values.map((category) {
          final isSelected = category == _selectedCategory;
          // Capitalize first letter for display, keep 'all' as 'All'
          final displayName = category == HomeCategory.all
              ? 'All'
              : category.name[0].toUpperCase() + category.name.substring(1);

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selected: isSelected,
              label: Text(displayName),
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFeaturedServices(ThemeData theme) {
    return SizedBox(
      height: 200,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: _servicesRepository.getFeaturedServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final services = snapshot.data ?? [];
          if (services.isEmpty) {
            return const Center(
              child: Text(
                'No services available yet.',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Container(
                width: 280,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailsScreen(service: service),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service['company'] ?? 'Company Name',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          service['servicedesc'] ?? 'No description',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(service['companylocation'] ?? 'No location'),
                            const Spacer(),
                            Icon(Icons.attach_money, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text('\$${service['salary']?.toStringAsFixed(2) ?? '0.00'}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}