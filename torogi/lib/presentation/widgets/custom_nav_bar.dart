import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomNavBar extends StatefulWidget {
  final Widget child;
  const CustomNavBar({super.key, required this.child});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  final List<String> _routes = ['/home', '/jobs', '/chats', '/notifications', '/settings'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final location = GoRouterState.of(context).uri.path;
    if (!_routes.contains(location)) return;
    setState(() {
      _selectedIndex = _routes.indexOf(location);
    });
  }

  void _onItemTapped(int index) {
    // Check if the tapped item is "Messages" (index 2)
    if (index == 2 && Supabase.instance.client.auth.currentUser == null) {
      // Show SnackBar prompting login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please log in to access Messages.'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Log In',
            textColor: Colors.white,
            onPressed: () {
              // Navigate to login page
              context.go('/login');
            },
          ),
        ),
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final location = GoRouterState.of(context).uri.path;
    final isProfilePage = location == '/profile';

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.colorScheme.surfaceVariant, // subtle contrasting background
        iconSize: 28,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedItemColor: theme.colorScheme.primary, // highlighted color
        unselectedItemColor: theme.colorScheme.onSurface.withOpacity(0.7),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}