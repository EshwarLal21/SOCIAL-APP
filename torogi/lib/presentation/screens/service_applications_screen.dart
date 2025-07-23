import 'package:flutter/material.dart';
import 'package:torogi/features/services/services_repository.dart';
import '../../data/local/database/app_database.dart';

class ServiceApplicationsScreen extends StatefulWidget {
  final String serviceId;
  final ServicesRepository repository;

  ServiceApplicationsScreen({
    super.key,
    required this.serviceId,
    required this.repository,
  });

  @override
  State<ServiceApplicationsScreen> createState() => _ServiceApplicationsScreenState();
}

class _ServiceApplicationsScreenState extends State<ServiceApplicationsScreen> {
  Future<void> _updateApplicationStatus(String applicationId, String newStatus) async {
    try {
      await widget.repository.updateApplicationStatus(applicationId, newStatus);
      // Refresh UI after status update
      setState(() {});
    } catch (e) {
      debugPrint('Error updating application status: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating status: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Applications'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: widget.repository.getServiceApplications(widget.serviceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final applications = snapshot.data ?? [];
          if (applications.isEmpty) {
            return const Center(child: Text('No applications yet'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: applications.length,
            itemBuilder: (context, index) {
              final application = applications[index];
              final profile = application['profiles'] as Map<String, dynamic>?;
              final status = application['status'] ?? 'applied';

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile?['username'] ?? 'Anonymous',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  profile?['email'] ?? '',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuButton<String>(
                            initialValue: status,
                            onSelected: (String newStatus) {
                              _updateApplicationStatus(application['id'], newStatus);
                            },
                            itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(
                                value: 'applied',
                                child: Text('Applied'),
                              ),
                              const PopupMenuItem(
                                value: 'accepted',
                                child: Text('Accept'),
                              ),
                              const PopupMenuItem(
                                value: 'rejected',
                                child: Text('Reject'),
                              ),
                              const PopupMenuItem(
                                value: 'completed',
                                child: Text('Complete'),
                              ),
                            ],
                            child: Chip(
                              label: Text(
                                status.toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: _getStatusColor(status),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        application['message'] ?? 'No message',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Applied on: ${_formatDate(application['createdat'])}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'applied':
        return Colors.blue;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'completed':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'Unknown date';
    final date = DateTime.parse(dateStr);
    return '${date.day}/${date.month}/${date.year}';
  }
}