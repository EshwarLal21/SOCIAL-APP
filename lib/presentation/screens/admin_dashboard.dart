import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/data/repositories/admin_repository.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'package:torogi/features/admin/admin_bloc.dart';
import 'package:torogi/features/admin/admin_event.dart';
import 'package:torogi/features/admin/admin_state.dart';
import 'package:torogi/main.dart';

class AdminDashboard extends StatefulWidget {
  final String initialPage;
  
  const AdminDashboard({
    super.key,
    this.initialPage = 'dashboard',
  });

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late int _selectedIndex;
  final List<String> _routes = [
    '/admin',
    '/admin/jobs',
    '/admin/notifications',
    '/admin/settings'
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = _getInitialIndex();
  }

  int _getInitialIndex() {
    switch (widget.initialPage) {
      case 'dashboard':
        return 0;
      case 'jobs':
        return 1;
      case 'notifications':
        return 2;
      case 'settings':
        return 3;
      default:
        return 0;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update selected index based on current route
    final location = GoRouterState.of(context).uri.path;
    if (_routes.contains(location)) {
      final index = _routes.indexOf(location);
      if (index != _selectedIndex) {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Don't navigate if already on the page
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    // Create a new instance of AdminBloc with repository
    return BlocProvider(
      create: (context) => AdminBloc(getIt<AdminRepository>())..add(LoadAdminDashboard()),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          
          return Scaffold(
            appBar: AppBar(
              title: Text(_getTitle()),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    getIt<AuthRepository>().logout();
                    context.go('/login');
                  },
                  tooltip: 'Logout',
                ),
              ],
            ),
            body: BlocBuilder<AdminBloc, AdminState>(
              builder: (context, state) {
                print('Building AdminDashboard with state: ${state.runtimeType}');
                
                if (state is AdminLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (state is AdminError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: ${state.message}'),
                        ElevatedButton(
                          onPressed: () {
                            context.read<AdminBloc>().add(LoadAdminDashboard());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                
                if (state is AdminLoaded) {
                  print('AdminLoaded state received:');
                  print('- Users count: ${state.userCount}');
                  print('- Posts count: ${state.postCount}');
                  print('- Services count: ${state.serviceCount}');
                  print('- Jobs count: ${state.jobCount}');
                  print('- Services list length: ${state.services.length}');
                  print('- Jobs list length: ${state.jobs.length}');
                  
                  return _buildContent(context, state);
                }
                
                print('Unknown state type: ${state.runtimeType}');
                return const Center(child: CircularProgressIndicator());
              },
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: theme.colorScheme.secondary,
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                backgroundColor: theme.colorScheme.secondary,
                selectedItemColor: theme.colorScheme.tertiary,
                unselectedItemColor: theme.colorScheme.surface,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.work),
                    label: 'Jobs',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Admin Dashboard';
      case 1:
        return 'Manage Jobs';
      case 2:
        return 'Admin Notifications';
      case 3:
        return 'Admin Settings';
      default:
        return 'Admin Dashboard';
    }
  }

  Widget _buildContent(BuildContext context, AdminLoaded state) {
    switch (_selectedIndex) {
      case 0:
        return _buildOverview(context, state);
      case 1:
        return _buildJobsList(context, state);
      case 2:
        return _buildNotifications(context);
      case 3:
        return _buildSettings(context);
      default:
        return _buildOverview(context, state);
    }
  }

  Widget _buildOverview(BuildContext context, AdminLoaded state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatCard(
                context,
                'Users',
                state.userCount.toString(),
                Icons.people,
              ),
              _buildStatCard(
                context,
                'Posts',
                state.postCount.toString(),
                Icons.post_add,
              ),
              _buildStatCard(
                context,
                'Services',
                state.serviceCount.toString(),
                Icons.miscellaneous_services,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Action Buttons
          _buildActionButton(
            context,
            'User Reports',
            Icons.report,
            () {},
            Colors.red.withOpacity(0.1),
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            context,
            'Suggestions & Problems',
            Icons.lightbulb,
            () {},
            Colors.green.withOpacity(0.1),
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            context,
            'Confirm User Upgrades',
            Icons.upgrade,
            () {},
            Colors.green.withOpacity(0.1),
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            context,
            'Confirm Server Upgrades',
            Icons.cloud_upload,
            () {},
            Colors.green.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  Widget _buildJobsList(BuildContext context, AdminLoaded state) {
    final theme = Theme.of(context);
    
    print('Building jobs list...');
    print('Number of jobs: ${state.jobs.length}');
    print('Number of services: ${state.services.length}');
    
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: theme.colorScheme.surface,
            child: TabBar(
              labelColor: theme.colorScheme.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: theme.colorScheme.primary,
              tabs: const [
                Tab(
                  icon: Icon(Icons.work),
                  text: 'Jobs',
                ),
                Tab(
                  icon: Icon(Icons.miscellaneous_services),
                  text: 'Services',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Jobs List
                Builder(
                  builder: (context) {
                    print('Building jobs tab view...');
                    if (state.jobs.isEmpty) {
                      print('No jobs found in state');
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.work_off,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No jobs available',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    print('Building jobs ListView with ${state.jobs.length} items');
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.jobs.length,
                      itemBuilder: (context, index) {
                        final job = state.jobs[index];
                        print('Building job item $index: ${job['jobtitle']}');
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              job['jobtitle'] ?? 'No title',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(job['jobdesc'] ?? 'No description'),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, 
                                      size: 16, 
                                      color: theme.colorScheme.primary
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      job['joblocation'] ?? 'No location',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money, 
                                      size: 16, 
                                      color: theme.colorScheme.primary
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Salary: \$${job['salary']?.toString() ?? '0'}',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    const SizedBox(width: 16),
                                    Icon(Icons.people, 
                                      size: 16, 
                                      color: theme.colorScheme.primary
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Slots: ${job['slots']?.toString() ?? '1'}',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: PopupMenuButton(
                              icon: Icon(
                                Icons.more_vert,
                                color: theme.colorScheme.primary,
                              ),
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ],
                              onSelected: (value) {
                                // Handle menu item selection
                                if (value == 'edit') {
                                  // TODO: Implement edit functionality
                                } else if (value == 'delete') {
                                  // TODO: Implement delete functionality
                                }
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                // Services List
                Builder(
                  builder: (context) {
                    print('Building services tab view...');
                    if (state.services.isEmpty) {
                      print('No services found in state');
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No services available',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    print('Building services ListView with ${state.services.length} items');
    return ListView.builder(
      padding: const EdgeInsets.all(8),
                      itemCount: state.services.length,
      itemBuilder: (context, index) {
                        final service = state.services[index];
                        print('Building service item $index: ${service['company']}');
        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: service['serviceimage'] != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      service['serviceimage'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.business,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                            title: Text(
                              service['company'] ?? 'No title',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(service['servicedesc'] ?? 'No description'),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, 
                                      size: 16, 
                                      color: theme.colorScheme.primary
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      service['companylocation'] ?? 'No location',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.category, 
                                      size: 16, 
                                      color: theme.colorScheme.primary
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      service['servicetype'] ?? 'No type',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    const SizedBox(width: 16),
                                    Icon(Icons.star, 
                                      size: 16, 
                                      color: theme.colorScheme.primary
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Rating: ${service['servicerating']?.toString() ?? '0.0'}',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: PopupMenuButton(
                              icon: Icon(
                                Icons.more_vert,
                                color: theme.colorScheme.primary,
                              ),
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ],
                              onSelected: (value) {
                                // Handle menu item selection
                                if (value == 'edit') {
                                  // TODO: Implement edit functionality
                                } else if (value == 'delete') {
                                  // TODO: Implement delete functionality
                                }
                              },
                            ),
          ),
        );
      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotifications(BuildContext context) {
    return const Center(
      child: Text('Admin Notifications Coming Soon'),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.admin_panel_settings),
          title: const Text('Admin Settings'),
          subtitle: const Text('Manage admin permissions and roles'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security Settings'),
          subtitle: const Text('Configure security options'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.backup),
          title: const Text('Backup Settings'),
          subtitle: const Text('Configure automatic backups'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications_active),
          title: const Text('Notification Settings'),
          subtitle: const Text('Configure admin notifications'),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: theme.colorScheme.primary),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
    Color backgroundColor,
  ) {
    final theme = Theme.of(context);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary),
              const SizedBox(width: 16),
              Text(
                title,
                style: theme.textTheme.titleMedium,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: theme.colorScheme.primary,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 