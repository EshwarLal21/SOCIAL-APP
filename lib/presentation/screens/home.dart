import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/presentation/widgets/blogs_list.dart';
import 'package:torogi/presentation/widgets/services_list.dart';
import 'package:torogi/presentation/widgets/users_list.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/presentation/screens/create_blog.dart';
import 'package:torogi/features/services/services_repository.dart';
import 'package:torogi/presentation/screens/search_screen.dart';
import 'package:torogi/presentation/screens/service_details_screen.dart';

enum HomeCategory { 
  tech, culture, travel, sports, fashion, beauty, festivals, events, others
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeCategory _selectedCategory = HomeCategory.tech;
  final ServicesRepository _servicesRepository = ServicesRepository();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        elevation: 0.5,
        title: Row(
          children: [
            const Icon(Icons.flash_on, color: Colors.deepPurple, size: 28),
            const SizedBox(width: 8),
            Text(
              "Torogi",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () { /*...*/ }),
          IconButton(icon: const Icon(Icons.add), onPressed: () { /*...*/ }),
          IconButton(
            icon: const CircleAvatar(radius: 14, backgroundImage: AssetImage('assets/profile.png')),
            onPressed: () => context.go('/profile'),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryButtons(),
            const SizedBox(height: 20),

            // Featured Users
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Featured Users",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            UserList(currentUserId: Supabase.instance.client.auth.currentUser!.id),
            const SizedBox(height: 20),

            // Featured Services
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Featured Services",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
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
            ),
            const SizedBox(height: 20),

            // Latest Blogs
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Latest Blogs",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            BlogList(category: _selectedCategory.name),
            const SizedBox(height: 20),
          ],
        ),
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
          final displayName = category.name[0].toUpperCase() + category.name.substring(1);
          
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
}