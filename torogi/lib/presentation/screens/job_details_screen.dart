import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:torogi/features/jobs/jobs_bloc.dart';

class JobDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> job;
  
  const JobDetailsScreen({
    super.key,
    required this.job,
  });

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  Future<List<Map<String, dynamic>>> _fetchApplications() async {
    try {
      final response = await Supabase.instance.client
          .from('job_applications')
          .select('''
  *,
  user:users!userid(
    id,
    username,
    email,
    profilepic
  )
''')
          .eq('jobid', widget.job['id'])
          .order('createdat', ascending: false);
      
      if (response == null) return [];
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('Error fetching applications: $e');
      rethrow;
    }
  }

  Future<void> _deleteJob(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Job'),
        content: const Text('Are you sure you want to delete this job?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        context.read<JobsBloc>().add(DeleteJob(widget.job['id']));
        if (context.mounted) {
          Navigator.pop(context); // Go back to jobs list
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error deleting job: $e')),
          );
        }
      }
    }
  }

  void _editJob(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _EditJobForm(job: widget.job),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = Supabase.instance.client.auth.currentUser?.id;
    final isJobPoster = widget.job['userid'] == currentUserId;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        actions: isJobPoster ? [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editJob(context),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteJob(context),
          ),
        ] : null,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.job['jobtitle'] ?? 'No Title',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.job['jobdesc'] ?? 'No Description',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    icon: Icons.location_on,
                    text: widget.job['joblocation'] ?? 'No location',
                    endIcon: Icons.attach_money,
                    endText: '\$${widget.job['salary']?.toStringAsFixed(2) ?? '0.00'}',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    icon: Icons.people,
                    text: '${widget.job['slots'] ?? 1} position(s)',
                    endIcon: Icons.phone,
                    endText: widget.job['contact'] ?? 'No contact',
                  ),
                ],
              ),
            ),
            if (isJobPoster) ...[
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Applications',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchApplications(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.error_outline, size: 48, color: Colors.red),
                            const SizedBox(height: 16),
                            Text('Error: ${snapshot.error}'),
                            const SizedBox(height: 16),
                            FilledButton(
                              onPressed: () => setState(() {}),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final applications = snapshot.data ?? [];
                  if (applications.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('No applications yet'),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: applications.length,
                    itemBuilder: (context, index) {
                      final application = applications[index];
                      final applicant = application['user'] as Map<String, dynamic>;
                      
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: applicant['avatar_url'] != null
                                ? NetworkImage(applicant['avatar_url'])
                                : null,
                            child: applicant['avatar_url'] == null
                                ? Text((applicant['username'] ?? applicant['email']?[0] ?? '?').toString().toUpperCase())
                                : null,
                          ),
                          title: Text(applicant['username'] ?? applicant['email'] ?? 'Unknown User'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (applicant['email'] != null && applicant['username'] != null)
                                Text(applicant['email']),
                              Text('Applied: ${_formatDate(application['createdat'])}'),
                            ],
                          ),
                          trailing: application['cv_url'] != null
                              ? IconButton(
                                  icon: const Icon(Icons.file_download),
                                  onPressed: () async {
                                    if (application['cv_url'] != null) {
                                      final url = Uri.parse(application['cv_url']);
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    }
                                  },
                                )
                              : null,
                          isThreeLine: applicant['email'] != null && applicant['username'] != null,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required IconData endIcon,
    required String endText,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(text),
        const Spacer(),
        Icon(endIcon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(endText),
      ],
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return 'Invalid date';
    }
  }
}

class _EditJobForm extends StatefulWidget {
  final Map<String, dynamic> job;

  const _EditJobForm({required this.job});

  @override
  State<_EditJobForm> createState() => _EditJobFormState();
}

class _EditJobFormState extends State<_EditJobForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _locationController;
  late final TextEditingController _contactController;
  late final TextEditingController _salaryController;
  late final TextEditingController _slotsController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.job['jobtitle']);
    _descriptionController = TextEditingController(text: widget.job['jobdesc']);
    _locationController = TextEditingController(text: widget.job['joblocation']);
    _contactController = TextEditingController(text: widget.job['contact']);
    _salaryController = TextEditingController(text: widget.job['salary']?.toString() ?? '0');
    _slotsController = TextEditingController(text: widget.job['slots']?.toString() ?? '1');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _contactController.dispose();
    _salaryController.dispose();
    _slotsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<JobsBloc>().add(
        UpdateJob(
          jobId: widget.job['id'],
          jobTitle: _titleController.text,
          jobDesc: _descriptionController.text,
          jobLocation: _locationController.text,
          contact: _contactController.text,
          slots: int.tryParse(_slotsController.text) ?? 1,
          salary: double.tryParse(_salaryController.text) ?? 0,
          postDuration: DateTime.now().add(const Duration(days: 30)),
        ),
      );

      Navigator.pop(context); // Close the form
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Edit Job Post',
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
                  controller: _titleController,
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
                  controller: _descriptionController,
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
                  controller: _locationController,
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
                  controller: _contactController,
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
                  controller: _salaryController,
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
                  controller: _slotsController,
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
                  onPressed: _submitForm,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Update Job'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 