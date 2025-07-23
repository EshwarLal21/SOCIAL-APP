import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/features/profile/profile_bloc.dart';
import 'package:torogi/features/profile/profile_event.dart';
import 'package:torogi/features/profile/profile_state.dart';

class AdminUpgradeRequestsScreen extends StatefulWidget {
  const AdminUpgradeRequestsScreen({super.key});

  @override
  State<AdminUpgradeRequestsScreen> createState() => _AdminUpgradeRequestsScreenState();
}

class _AdminUpgradeRequestsScreenState extends State<AdminUpgradeRequestsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadUpgradeRequests());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin - Upgrade Requests'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the dashboard with the correct index (0)
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UpgradeRequestsLoaded) {
            final requests = state.requests;
            if (requests.isEmpty) {
              return const Center(child: Text('No pending requests'));
            }
            return ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];
                final fileUrls = request['file_urls'] as List<dynamic>? ?? []; // Handle null or cast to List
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('User: ${request['username']}'),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Requested: ${request['requested_value']}'),
                        const SizedBox(height: 8),
                        if (fileUrls.isNotEmpty)
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: fileUrls.length,
                              itemBuilder: (context, urlIndex) {
                                final url = fileUrls[urlIndex] as String? ?? '';
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.network(
                                    url,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        color: Colors.grey,
                                        child: const Center(child: Text('Failed to load')),
                                      );
                                    },
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        color: Colors.grey,
                                        child: const Center(child: CircularProgressIndicator()),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () {
                            context.read<ProfileBloc>().add(ReviewUpgradeRequest(
                              requestId: request['id'],
                              userId: request['user_id'],
                              status: 'approved',
                              requestedValue: request['requested_value'],
                            ));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            context.read<ProfileBloc>().add(ReviewUpgradeRequest(
                              requestId: request['id'],
                              userId: request['user_id'],
                              status: 'rejected',
                              rejectionReason: 'Not eligible',
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}