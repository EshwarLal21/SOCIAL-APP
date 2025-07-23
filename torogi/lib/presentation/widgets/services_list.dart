import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/features/services/services_repository.dart';
import 'package:torogi/presentation/screens/service_details_screen.dart';

class ServicesList extends StatefulWidget {
  final ServicesRepository _repository = ServicesRepository();
  final void Function(Map<String, dynamic>) onEditService;

  ServicesList({super.key, required this.onEditService});

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  String? selectedCategory; // Null means "All" categories

  // List of available categories
  final List<String> categories = [
    'All',
    'food',
    'health',
    'education',
    'electronics',
    'construction',
    'automotive',
    'entertainment',
    'others',
  ];

  Future<void> _applyForService(BuildContext context, Map<String, dynamic> service) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to hire')),
      );
      return;
    }

    try {
      final hasApplied = await widget._repository.hasUserApplied(service['id']);
      if (hasApplied) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have already sent a hire request for this service')),
          );
        }
        return;
      }

      final messageController = TextEditingController();
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hire Service'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Service: ${service['company']}'),
              const SizedBox(height: 16),
              TextField(
                controller: messageController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Message to Service Provider*',
                  hintText: 'Describe your requirements and timeline',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (messageController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please provide a message for the service provider'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                Navigator.pop(context, true);
              },
              child: const Text('Send Request'),
            ),
          ],
        ),
      );

      if (result == true && context.mounted) {
        await widget._repository.applyForService(service['id'], messageController.text);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Hire request sent successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error sending hire request: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _submitRating(BuildContext context, String serviceId) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to rate')),
      );
      return;
    }

    // Check for existing rating
    final existingRating = await Supabase.instance.client
        .from('servicerating')
        .select('rating')
        .eq('service_id', serviceId)
        .eq('user_id', userId)
        .maybeSingle();

    double initialRating = existingRating != null ? (existingRating['rating'] as num).toDouble() : 0.0;
    double rating = initialRating;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existingRating != null ? 'Update Rating' : 'Rate Service'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar.builder(
              initialRating: initialRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                rating = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (rating < 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select a rating'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              Navigator.pop(context, true);
            },
            child: Text(existingRating != null ? 'Update' : 'Submit'),
          ),
        ],
      ),
    );

    if (result == true && context.mounted) {
      try {
        if (existingRating != null) {
          // Update existing rating
          await Supabase.instance.client
              .from('servicerating')
              .update({
            'rating': rating.toInt(),
            'updated_at': DateTime.now().toIso8601String(),
          })
              .eq('service_id', serviceId)
              .eq('user_id', userId);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Rating updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Insert new rating
          await Supabase.instance.client.from('servicerating').insert({
            'service_id': serviceId,
            'user_id': userId,
            'rating': rating.toInt(),
            'created_at': DateTime.now().toIso8601String(),
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Rating submitted successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }

        // Refresh the UI to reflect the updated rating
        setState(() {});
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error ${existingRating != null ? 'updating' : 'submitting'} rating: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = Supabase.instance.client.auth.currentUser?.id;

    return Column(
      children: [
        // Categories Filter
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category || (category == 'All' && selectedCategory == null);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterChip(
                  label: Text(category.capitalize()),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = selected ? (category == 'All' ? null : category) : null;
                    });
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: widget._repository.getServices(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              final services = snapshot.data ?? [];
              final filteredServices = selectedCategory == null
                  ? services
                  : services.where((service) => service['servicetype'] == selectedCategory).toList();

              if (filteredServices.isEmpty) {
                return const Center(child: Text('No services available for this category'));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  final service = filteredServices[index];
                  final isServiceProvider = service['userid'] == Supabase.instance.client.auth.currentUser?.id;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailsScreen(service: service),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  service['company'] ?? 'Company Name',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (isServiceProvider)
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    if (value == 'edit') {
                                      widget.onEditService(service);
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(value: 'edit', child: Text('Edit')),
                                    // you can add more options here later
                                  ],
                                  child: const Icon(Icons.more_vert),
                                ),

                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            service['servicedesc'] ?? 'No description',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),
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
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.category, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(service['servicetype']?.toString().toUpperCase() ?? 'No type'),
                              const Spacer(),
                              if (!isServiceProvider)
                                TextButton.icon(
                                  onPressed: () => _applyForService(context, service),
                                  icon: const Icon(Icons.handshake),
                                  label: const Text('Hire'),
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: Supabase.instance.client
                                .from('servicerating')
                                .select('rating')
                                .eq('service_id', service['id']),
                            builder: (context, ratingSnapshot) {
                              double avgRating = 0.0;
                              int ratingCount = 0;
                              if (ratingSnapshot.hasData) {
                                final ratings = ratingSnapshot.data!
                                    .map((r) => r['rating'] as int)
                                    .toList();
                                ratingCount = ratings.length;
                                avgRating = ratings.isEmpty ? 0.0 : ratings.reduce((a, b) => a + b) / ratings.length;
                              }
                              return Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: avgRating,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
                                  const SizedBox(width: 8),
                                  Text('($ratingCount)'),
                                  const Spacer(),
                                  if (!isServiceProvider && userId != null)
                                    FutureBuilder<Map<String, dynamic>?>(
                                      future: Supabase.instance.client
                                          .from('servicerating')
                                          .select('rating')
                                          .eq('service_id', service['id'])
                                          .eq('user_id', userId)
                                          .maybeSingle(),
                                      builder: (context, userRatingSnapshot) {
                                        if (userRatingSnapshot.connectionState == ConnectionState.waiting) {
                                          return const SizedBox.shrink();
                                        }
                                        final existingRating = userRatingSnapshot.data;
                                        return TextButton.icon(
                                          onPressed: () => _submitRating(context, service['id']),
                                          icon: const Icon(Icons.star_border),
                                          label: Text(existingRating != null ? 'Update Rating' : 'Rate'),
                                        );
                                      },
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Extension to capitalize strings
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}