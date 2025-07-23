import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:torogi/features/services/services_bloc.dart';
import 'package:torogi/features/services/services_event.dart';
import 'package:torogi/features/services/services_state.dart';

class ServicesConList extends StatelessWidget {
  const ServicesConList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    BlocProvider.of<ServiceBloc>(context).add(LoadAllServices());

    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        if (state is ServiceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServiceError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is ServiceLoaded) {
          final services = state.services;
          if (services.isEmpty) {
            return const Center(child: Text('No services available'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiary,
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
                    // Title + Apply Button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            service['company'] ?? 'Service Provider',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FilledButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                              msg: "Applied to ${service['company'] ?? 'this service'}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: theme.colorScheme.secondary,
                            foregroundColor: theme.colorScheme.onSecondary,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text("Hire"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service['servicedesc'] ?? 'No description available',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.category, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(service['servicetype'] ?? 'No category'),
                        const Spacer(),
                        Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(service['companylocation'] ?? 'No location'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.attach_money, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text('\$${service['salary']?.toStringAsFixed(2) ?? '0.00'}'),
                        const Spacer(),
                        Icon(Icons.phone, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(service['contact'] ?? 'No contact'),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const Center(child: Text('No services data'));
      },
    );
  }
}
