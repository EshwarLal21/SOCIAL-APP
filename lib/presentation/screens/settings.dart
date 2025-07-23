import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../widgets/theme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final SupabaseClient _supabase = Supabase.instance.client;
  bool _isLoading = true;
  String _themeMode = 'system';
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final response = await _supabase
          .from('users')
          .select('theme_mode, notifications_enabled')
          .eq('id', userId)
          .maybeSingle();

      if (response != null) {
        setState(() {
          _themeMode = response['theme_mode'] ?? 'system';
          _notificationsEnabled = response['notifications_enabled'] ?? false;
        });
        _applyThemeFromString(_themeMode); // Apply saved theme on load
      }
    } catch (e) {
      debugPrint('Failed to load preferences: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load preferences: $e')),
        );
      }
    }

    setState(() => _isLoading = false);
  }

  Future<void> _updateTheme(String newTheme) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    try {
      await _supabase
          .from('users')
          .update({'theme_mode': newTheme})
          .eq('id', userId);

      setState(() => _themeMode = newTheme);
      _applyThemeFromString(newTheme);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Theme updated to $newTheme')),
      );
    } catch (e) {
      debugPrint('Failed to update theme: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update theme: $e')),
        );
      }
    }
  }

  void _applyThemeFromString(String value) {
    final cubit = context.read<ThemeCubit>();
    if (value == 'dark') {
      cubit.setDarkTheme();
    } else if (value == 'light') {
      cubit.setLightTheme();
    } else {
      cubit.setSystemTheme();
    }
  }

  Future<void> _updateNotifications(bool enabled) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    try {
      await _supabase
          .from('users')
          .update({'notifications_enabled': enabled})
          .eq('id', userId);

      setState(() => _notificationsEnabled = enabled);
      debugPrint('Notifications updated to $enabled');
    } catch (e) {
      debugPrint('Failed to update notifications: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update notifications: $e')),
        );
      }
    }
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Theme'),
        children: [
          RadioListTile<String>(
            value: 'system',
            groupValue: _themeMode,
            title: const Text('System'),
            onChanged: (value) {
              if (value != null) {
                _updateTheme(value);
                Navigator.pop(context);
              }
            },
          ),
          RadioListTile<String>(
            value: 'light',
            groupValue: _themeMode,
            title: const Text('Light'),
            onChanged: (value) {
              if (value != null) {
                _updateTheme(value);
                Navigator.pop(context);
              }
            },
          ),
          RadioListTile<String>(
            value: 'dark',
            groupValue: _themeMode,
            title: const Text('Dark'),
            onChanged: (value) {
              if (value != null) {
                _updateTheme(value);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Privacy & Security'),
        content: const Text(
          'Your data is securely stored and managed in accordance with our privacy policy.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Help & Support'),
        content: const Text(
          'For assistance, contact us at support@torogi.app or visit our FAQs.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Torogi App',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.info_outline),
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            'Torogi is a community-driven app platform designed to connect and empower users.',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Theme'),
            subtitle: Text('Current: ${_themeMode[0].toUpperCase()}${_themeMode.substring(1)}'),
            onTap: _showThemeDialog,
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            value: _notificationsEnabled,
            onChanged: (value) => _updateNotifications(value),
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy & Security'),
            onTap: _showPrivacyDialog,
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: _showHelpDialog,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: _showAboutDialog,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              try {
                await _supabase.auth.signOut();
                if (mounted) context.go('/login');
              } catch (e) {
                debugPrint('Logout failed: $e');
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed: $e')),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
