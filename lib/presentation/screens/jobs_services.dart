import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/features/jobs/jobs_bloc.dart';
import 'package:torogi/presentation/widgets/jobs_cont_list.dart';
import 'package:torogi/presentation/widgets/services_list.dart';
import 'package:torogi/main.dart'; // For getIt
import 'package:supabase_flutter/supabase_flutter.dart';

class JobsServices extends StatefulWidget {
  const JobsServices({super.key});

  @override
  State<JobsServices> createState() => _JobsServicesState();
}

class _JobsServicesState extends State<JobsServices> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Load jobs when screen is opened
    context.read<JobsBloc>().add(LoadJobs());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _showCreateServiceDialog(BuildContext context) async {
    final companyController = TextEditingController();
    final descriptionController = TextEditingController();
    final locationController = TextEditingController();
    final contactController = TextEditingController();
    final salaryController = TextEditingController();
    String selectedServiceType = 'others'; // Default value

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create New Service'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: companyController,
                  decoration: const InputDecoration(
                    labelText: 'Company Name*',
                    hintText: 'Enter company name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Service Description*',
                    hintText: 'Enter service description',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: 'Company Location*',
                    hintText: 'Enter company location',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contactController,
                  decoration: const InputDecoration(
                    labelText: 'Contact Information*',
                    hintText: 'Enter contact details',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Service Price',
                    hintText: 'Enter service price',
                    prefixText: '\$',
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedServiceType,
                  decoration: const InputDecoration(
                    labelText: 'Service Type*',
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
                      selectedServiceType = value;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
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

                try {
                  final userId = Supabase.instance.client.auth.currentUser?.id;
                  if (userId == null) {
                    throw Exception('User not authenticated');
                  }

                  // Create service
                  await Supabase.instance.client.from('services').insert({
                    'userid': userId,
                    'company': companyController.text.trim(),
                    'servicedesc': descriptionController.text.trim(),
                    'companylocation': locationController.text.trim(),
                    'contact': contactController.text.trim(),
                    'salary': double.tryParse(salaryController.text) ?? 0,
                    'servicetype': selectedServiceType,
                    'createdat': DateTime.now().toIso8601String(),
                  });

                  if (context.mounted) {
                    Navigator.pop(context); // Close dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Service created successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error creating service: ${e.toString()}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs & Services'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Jobs'),
            Tab(text: 'Services'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Jobs Tab
          const JobsContList(),
          
          // Services Tab
          ServicesList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show job creation form based on current tab
          if (_tabController.index == 0) {
            _showCreateJobDialog(context);
          } else {
            _showCreateServiceDialog(context);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateJobDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final locationController = TextEditingController();
    final contactController = TextEditingController();
    final salaryController = TextEditingController();
    final slotsController = TextEditingController(text: '1');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
      child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                      const Text(
                        'Create Job Post',
              style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Job Title',
                      hintText: 'Enter job title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a job title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: descController,
                    decoration: const InputDecoration(
                      labelText: 'Job Description',
                      hintText: 'Enter job description',
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a job description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      hintText: 'Enter job location',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: contactController,
                    decoration: const InputDecoration(
                      labelText: 'Contact Information',
                      hintText: 'Enter contact details',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter contact information';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: salaryController,
                    decoration: const InputDecoration(
                      labelText: 'Salary',
                      hintText: 'Enter salary amount',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a salary amount';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: slotsController,
                    decoration: const InputDecoration(
                      labelText: 'Number of Positions',
                      hintText: 'Enter number of available positions',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter number of positions';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<JobsBloc>().add(
                          CreateJob(
                            jobTitle: titleController.text,
                            jobDesc: descController.text,
                            jobLocation: locationController.text,
                            contact: contactController.text,
                            slots: int.parse(slotsController.text),
                            salary: double.parse(salaryController.text),
                            postDuration: DateTime.now().add(const Duration(days: 30)),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Post Job'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
