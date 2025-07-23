import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/features/services/services_repository.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  late TextEditingController companyController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;
  late TextEditingController contactController;
  late TextEditingController salaryController;
  late String selectedServiceType;
  bool isEditing = false;
  final ServicesRepository _repository = ServicesRepository();

  @override
  void initState() {
    super.initState();
    companyController = TextEditingController(text: widget.service['company']);
    descriptionController = TextEditingController(text: widget.service['servicedesc']);
    locationController = TextEditingController(text: widget.service['companylocation']);
    contactController = TextEditingController(text: widget.service['contact']);
    salaryController = TextEditingController(text: widget.service['salary']?.toString() ?? '0');
    selectedServiceType = widget.service['servicetype'] ?? 'others';
  }

  @override
  void dispose() {
    companyController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    contactController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  Future<void> _updateService() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      // Validate required fields
      if (companyController.text.isEmpty ||
          descriptionController.text.isEmpty ||
          locationController.text.isEmpty ||
          contactController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill in all required fields'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      await Supabase.instance.client.from('services').update({
        'company': companyController.text.trim(),
        'servicedesc': descriptionController.text.trim(),
        'companylocation': locationController.text.trim(),
        'contact': contactController.text.trim(),
        'salary': double.tryParse(salaryController.text) ?? 0,
        'servicetype': selectedServiceType,
      }).eq('id', widget.service['id']);

      if (mounted) {
        setState(() {
          isEditing = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Service updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating service: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteService() async {
    try {
      await Supabase.instance.client
          .from('services')
          .delete()
          .eq('id', widget.service['id']);

      if (mounted) {
        Navigator.pop(context); // Return to previous screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Service deleted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting service: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _updateApplicationStatus(String applicationId, String newStatus) async {
    try {
      await _repository.updateApplicationStatus(applicationId, newStatus);
      setState(() {}); // Refresh the UI
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Application ${newStatus.toLowerCase()} successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating application: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _confirmDelete() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Service'),
          content: const Text('Are you sure you want to delete this service?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                _deleteService();
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildApplicationsList() {
    final isOwner = widget.service['userid'] == Supabase.instance.client.auth.currentUser?.id;
    if (!isOwner) return const SizedBox.shrink();

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _repository.getServiceApplications(widget.service['id']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final applications = snapshot.data ?? [];
        if (applications.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text('No hire requests yet'),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Hire Requests',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final application = applications[index];
                final status = application['status'] ?? 'pending';
                final username = application['users']?['username'] ?? 'Unknown User';
                final message = application['message'] ?? 'No message provided';

                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Chip(
                              label: Text(status.toUpperCase()),
                              backgroundColor: status == 'approved'
                                  ? Colors.green
                                  : status == 'rejected'
                                      ? Colors.red
                                      : Colors.orange,
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(message),
                        if (status == 'applied') ...[
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => _updateApplicationStatus(
                                    application['id'], 'rejected'),
                                child: const Text('Reject'),
                              ),
                              const SizedBox(width: 8),
                              FilledButton(
                                onPressed: () => _updateApplicationStatus(
                                    application['id'], 'approved'),
                                child: const Text('Approve'),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isOwner = widget.service['userid'] == Supabase.instance.client.auth.currentUser?.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Details'),
        actions: isOwner
            ? [
                IconButton(
                  icon: Icon(isEditing ? Icons.close : Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                ),
                if (!isEditing)
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: _confirmDelete,
                  ),
              ]
            : null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: companyController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'Company Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              enabled: isEditing,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Service Description',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: locationController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'Company Location',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'Contact Information',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: salaryController,
              enabled: isEditing,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Service Price',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 16),
            if (isEditing)
              DropdownButtonFormField<String>(
                value: selectedServiceType,
                decoration: const InputDecoration(
                  labelText: 'Service Type',
                ),
                items: const [
                  DropdownMenuItem(value: 'food', child: Text('Food')),
                  DropdownMenuItem(value: 'health', child: Text('Health')),
                  DropdownMenuItem(value: 'education', child: Text('Education')),
                  DropdownMenuItem(value: 'electronics', child: Text('Electronics')),
                  DropdownMenuItem(value: 'construction', child: Text('Construction')),
                  DropdownMenuItem(value: 'automotive', child: Text('Automotive')),
                  DropdownMenuItem(value: 'entertainment', child: Text('Entertainment')),
                  DropdownMenuItem(value: 'others', child: Text('Others')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedServiceType = value;
                    });
                  }
                },
              )
            else
              ListTile(
                title: const Text('Service Type'),
                subtitle: Text(selectedServiceType.toUpperCase()),
              ),
            const SizedBox(height: 24),
            if (isEditing)
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _updateService,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Save Changes'),
                ),
              ),
            if (isOwner) _buildApplicationsList(),
          ],
        ),
      ),
    );
  }
} 