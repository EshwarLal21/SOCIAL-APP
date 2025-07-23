import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/features/services/services_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/presentation/screens/service_details_screen.dart';

class ServicesList extends StatelessWidget {
  final ServicesRepository _repository = ServicesRepository();

  ServicesList({super.key});

  Future<void> _applyForService(BuildContext context, Map<String, dynamic> service) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to hire')),
      );
      return;
    }

    try {
      // Check if user has already applied
      final hasApplied = await _repository.hasUserApplied(service['id']);
      if (hasApplied) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have already sent a hire request for this service')),
          );
        }
        return;
      }

      // Show hire request dialog
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
        await _repository.applyForService(service['id'], messageController.text);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _repository.getServices(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
          }

        final services = snapshot.data ?? [];
            if (services.isEmpty) {
          return const Center(child: Text('No services available'));
            }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
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
                          const Chip(
                            label: Text('Your Service'),
                            backgroundColor: Colors.blue,
                            labelStyle: TextStyle(color: Colors.white),
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
                  ],
                ),
              ),
            );
        },
        );
      },
    );
  }
}