import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/features/jobs/jobs_bloc.dart';

class JobList extends StatelessWidget {
  const JobList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        if (state is JobsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is JobsError) {
          return Center(child: Text(state.message));
        }

        if (state is JobsLoaded) {
          if (state.jobs.isEmpty) {
            return const Center(child: Text('No jobs available'));
          }

          return ListView.builder(
            itemCount: state.jobs.length,
            itemBuilder: (context, index) {
              final job = state.jobs[index];
              final isJobPoster = job['userid'] == Supabase.instance.client.auth.currentUser?.id;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  onTap: () {
                    context.push('/jobs/${job['id']}', extra: job);
                  },
                  title: Text(
                    job['jobtitle'] ?? 'No Title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(job['jobdesc'] ?? 'No Description'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(job['joblocation'] ?? 'No location'),
                          const Spacer(),
                          Icon(Icons.attach_money, size: 16, color: Colors.grey[600]),
                          Text('\$${job['salary']?.toStringAsFixed(2) ?? '0.00'}'),
                        ],
                      ),
                    ],
                  ),
                  trailing: isJobPoster
                      ? const Icon(Icons.edit, color: Colors.blue)
                      : null,
                ),
              );
            },
          );
        }

        return const Center(child: Text('Something went wrong'));
      },
    );
  }
} 