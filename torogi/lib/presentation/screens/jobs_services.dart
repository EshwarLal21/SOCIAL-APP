import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/features/jobs/jobs_bloc.dart';
import 'package:torogi/presentation/widgets/jobs_cont_list.dart';
import 'package:torogi/presentation/widgets/services_list.dart';

class JobsServices extends StatefulWidget {
  const JobsServices({super.key});

  @override
  State<JobsServices> createState() => _JobsServicesState();
}

class _JobsServicesState extends State<JobsServices> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> userTypes = ['employer', 'serviceprovider', 'guest', 'admin'];
  String? userType;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    context.read<JobsBloc>().add(LoadJobs());
    _fetchUserType();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {}); // Update UI when tab changes to refresh FAB
  }

  Future<void> _fetchUserType() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId != null) {
        final response = await Supabase.instance.client
            .from('users')
            .select('usertype')
            .eq('id', userId)
            .single();

        if (response['usertype'] != null) {
          setState(() {
            userType = response['usertype'] as String;
            isLoading = false;
          });
        } else {
          setState(() {
            userType = 'guest';
            isLoading = false;
          });
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User type not found'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      } else {
        setState(() {
          userType = 'guest';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching user type: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  Future<void> _showEditServiceDialog(BuildContext context, Map<String, dynamic> service) async {
    final companyController = TextEditingController(text: service['company']);
    final descriptionController = TextEditingController(text: service['servicedesc']);
    final locationController = TextEditingController(text: service['companylocation']);
    final contactController = TextEditingController(text: service['contact']);
    final salaryController = TextEditingController(text: service['salary'].toString());
    String selectedServiceType = service['servicetype'];
    bool isSubmitting = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Edit Service'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: companyController,
                      decoration: const InputDecoration(labelText: 'Company Name'),
                    ),
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(labelText: 'Description'),
                    ),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(labelText: 'Location'),
                    ),
                    TextField(
                      controller: contactController,
                      decoration: const InputDecoration(labelText: 'Contact Info'),
                    ),
                    TextField(
                      controller: salaryController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Service Price'),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedServiceType,
                      decoration: const InputDecoration(labelText: 'Service Type'),
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
                          setDialogState(() => selectedServiceType = value);
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
                  onPressed: isSubmitting
                      ? null
                      : () async {
                    if (companyController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        locationController.text.isEmpty ||
                        contactController.text.isEmpty ||
                        salaryController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    setDialogState(() => isSubmitting = true);

                    try {
                      await Supabase.instance.client
                          .from('services')
                          .update({
                        'company': companyController.text.trim(),
                        'servicedesc': descriptionController.text.trim(),
                        'companylocation': locationController.text.trim(),
                        'contact': contactController.text.trim(),
                        'salary': double.parse(salaryController.text),
                        'servicetype': selectedServiceType,
                        'updatedat': DateTime.now().toIso8601String(),
                      })
                          .eq('id', service['id']);

                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Service updated successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error updating service: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } finally {
                      setDialogState(() => isSubmitting = false);
                    }
                  },
                  child: isSubmitting
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(width: 12),
            const Text(
              'Jobs & Services',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.green[500],
        elevation: 4,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: 'Employment'),
            Tab(text: 'Service'),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Prevent swipe to avoid unintended tab switches
        children:  [
          JobsContList(),
          ServicesList(onEditService: (service) => _showEditServiceDialog(context, service)),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget? _buildFloatingActionButton() {
    if (isLoading || userType == null) return null;

    if (userType == 'employer' && _tabController.index == 0) {
      return FloatingActionButton(
        onPressed: () => _showCreateJobDialog(context),
        backgroundColor: Colors.green[500],
        tooltip: 'Create Job',
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    if (userType == 'serviceprovider' && _tabController.index == 1) {
      return FloatingActionButton(
        onPressed: () => _showCreateServiceDialog(context),
        backgroundColor: Colors.green[500],
        tooltip: 'Create Service',
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    return null;
  }

  Future<void> _showCreateServiceDialog(BuildContext context) async {
    final companyController = TextEditingController();
    final descriptionController = TextEditingController();
    final locationController = TextEditingController();
    final contactController = TextEditingController();
    final salaryController = TextEditingController();
    String selectedServiceType = 'others';
    bool isSubmitting = false;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
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
                        labelText: 'Service Price*',
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
                          setDialogState(() {
                            selectedServiceType = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSubmitting ? null : () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: isSubmitting
                      ? null
                      : () async {
                    if (companyController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        locationController.text.isEmpty ||
                        contactController.text.isEmpty ||
                        salaryController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all required fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (double.tryParse(salaryController.text) == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid service price'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    setDialogState(() => isSubmitting = true);

                    try {
                      final userId = Supabase.instance.client.auth.currentUser?.id;
                      if (userId == null) {
                        throw Exception('User not authenticated');
                      }

                      await Supabase.instance.client.from('services').insert({
                        'userid': userId,
                        'company': companyController.text.trim(),
                        'servicedesc': descriptionController.text.trim(),
                        'companylocation': locationController.text.trim(),
                        'contact': contactController.text.trim(),
                        'salary': double.parse(salaryController.text),
                        'servicetype': selectedServiceType,
                        'createdat': DateTime.now().toIso8601String(),
                      });

                      if (context.mounted) {
                        Navigator.pop(context);
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
                            content: Text('Error creating service: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } finally {
                      if (context.mounted) {
                        setDialogState(() => isSubmitting = false);
                      }
                    }
                  },
                  child: isSubmitting
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Text('Create'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showCreateJobDialog(BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final locationController = TextEditingController();
    final contactController = TextEditingController();
    final salaryController = TextEditingController();
    final slotsController = TextEditingController(text: '1');
    bool isSubmitting = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return Padding(
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
                            onPressed: isSubmitting ? null : () => Navigator.pop(context),
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
                          if (value ==

                              null || value.isEmpty) {
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
                          if (double.tryParse(value) == null || double.parse(value) <= 0) {
                            return 'Please enter a valid positive number';
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
                          if (int.tryParse(value) == null || int.parse(value) <= 0) {
                            return 'Please enter a valid positive number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: isSubmitting
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            setDialogState(() => isSubmitting = true);
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
                        child: isSubmitting
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                            : const Text('Post Job'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}