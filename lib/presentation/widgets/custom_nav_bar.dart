import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    // Update selected index based on current route
    final location = GoRouterState.of(context).uri.path;
    if (!_routes.contains(location)) {
      // For routes not in bottom nav (like profile), keep last valid index
      return;
    }
    setState(() {
      _selectedIndex = _routes.indexOf(location);
    });
  }

  void _onItemTapped(int index) {
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: theme.colorScheme.secondary,
        ),
        child: BottomNavigationBar(
          iconSize: 30,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          backgroundColor: theme.colorScheme.secondary,
          selectedItemColor: isProfilePage 
              ? theme.colorScheme.surface 
              : theme.colorScheme.tertiary,
          unselectedItemColor: theme.colorScheme.surface,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Messages',
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
  }
}
