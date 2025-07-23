import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/features/jobs/jobs_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class JobsContList extends StatelessWidget {
  const JobsContList({super.key});

  // Check if user has already applied to this job
  Future<bool> _hasUserApplied(String jobId) async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return false;

      final response = await Supabase.instance.client
          .from('job_applications')
          .select()
          .eq('jobid', jobId)
          .eq('userid', userId)
          .limit(1);
      
      return (response as List).isNotEmpty;
    } catch (e) {
      debugPrint('Error checking application status: $e');
      return false;
    }
  }

  Future<void> _applyForJob(BuildContext context, Map<String, dynamic> job) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to apply')),
      );
      return;
    }

    try {
      // First check if user has already applied
      final existingApplications = await Supabase.instance.client
          .from('job_applications')
          .select()
          .eq('jobid', job['id'])
          .eq('userid', userId);

      if (existingApplications.isNotEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have already applied for this job')),
          );
        }
        return;
      }

      // Show file type selection dialog
      final result = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select CV Format'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.picture_as_pdf),
                  title: const Text('PDF Document'),
                  onTap: () => Navigator.pop(context, 'pdf'),
                ),
                ListTile(
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('Image of Document'),
                  onTap: () => Navigator.pop(context, 'image'),
                ),
              ],
            ),
          );
        },
      );

      if (result != null) {
        final picker = ImagePicker();
        XFile? pickedFile;
        
        if (result == 'pdf') {
          pickedFile = await picker.pickMedia();
        } else {
          pickedFile = await picker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 70,
          );
        }

        if (pickedFile != null) {
          if (context.mounted) {
            // Show loading indicator
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 16),
                    Text('Uploading your application...'),
                  ],
                ),
                duration: Duration(seconds: 15),
              ),
            );
          }

          final fileName = '${DateTime.now().millisecondsSinceEpoch}_${pickedFile.name}';
          final bytes = await pickedFile.readAsBytes();

          // Check file size (5MB limit)
          if (bytes.length > 5242880) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('File size must be less than 5MB'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            return;
          }

          // Upload CV to storage
          final filePath = '$userId/$fileName';
          await Supabase.instance.client.storage
              .from('cvs')
              .uploadBinary(
                filePath,
                bytes,
                fileOptions: FileOptions(
                  contentType: result == 'pdf' ? 'application/pdf' : 'image/jpeg',
                  upsert: true,
                ),
              );

          // Get the public URL for the uploaded file
          final fileUrl = Supabase.instance.client.storage
              .from('cvs')
              .getPublicUrl(filePath);

          // Create job application record
          if (context.mounted) {
            await Supabase.instance.client.from('job_applications').insert({
              'userid': userId,
              'jobid': job['id'],
              'cv_url': fileUrl,
              'status': 'applied',
              'createdat': DateTime.now().toIso8601String(),
            });

            // Show success message
            if (context.mounted) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Application submitted successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error applying for job: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        if (state is JobsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is JobsError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is JobsLoaded) {
          final jobs = state.jobs;
          if (jobs.isEmpty) {
            return const Center(child: Text('No jobs available'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              final isJobPoster = job['userid'] == Supabase.instance.client.auth.currentUser?.id;

              return GestureDetector(
                onTap: () {
                  context.push('/jobs/${job['id']}', extra: job);
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
                              job['jobtitle'] ?? 'Job Title',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (isJobPoster)
                            const Chip(
                              label: Text('Your Post'),
                              backgroundColor: Colors.blue,
                              labelStyle: TextStyle(color: Colors.white),
                            )
                          else
                            FutureBuilder<bool>(
                              future: _hasUserApplied(job['id']),
                              builder: (context, snapshot) {
                                final hasApplied = snapshot.data ?? false;
                                return hasApplied
                                  ? const Chip(
                                      label: Text('Applied'),
                                      backgroundColor: Colors.green,
                                      labelStyle: TextStyle(color: Colors.white),
                                    )
                                  : FilledButton(
                                      onPressed: () => _applyForJob(context, job),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: theme.colorScheme.primary,
                                        foregroundColor: theme.colorScheme.onPrimary,
                                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Text("Apply"),
                                    );
                              },
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        job['jobdesc'] ?? 'No description available',
                        style: TextStyle(color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(job['joblocation'] ?? 'No location'),
                          const Spacer(),
                          Icon(Icons.attach_money, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text('\$${job['salary']?.toStringAsFixed(2) ?? '0.00'}'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(_formatPostedDate(job['postduration'])),
                          const Spacer(),
                          Icon(Icons.people, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text('${job['slots'] ?? 1} position(s)'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return const Center(child: Text('No job data available'));
      },
    );
  }

  String _formatPostedDate(dynamic postDuration) {
    if (postDuration is String) {
      final postDate = DateTime.tryParse(postDuration);
      if (postDate != null) {
        final now = DateTime.now();
        final diff = now.difference(postDate);
        if (diff.inDays >= 1) return "${diff.inDays} day(s) ago";
        if (diff.inHours >= 1) return "${diff.inHours} hour(s) ago";
        return "${diff.inMinutes} min ago";
      }
    }
    return 'Unknown';
  }
}
