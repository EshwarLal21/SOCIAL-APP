import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/data/repositories/profile_repository.dart';
import 'package:torogi/features/profile/profile_bloc.dart';
import 'package:torogi/presentation/screens/admin_dashboard.dart';
import 'package:torogi/presentation/screens/chats_screen.dart';
import 'package:torogi/presentation/screens/home.dart';
import 'package:torogi/presentation/screens/jobs_services.dart';
import 'package:torogi/presentation/screens/login.dart';
import 'package:torogi/presentation/screens/notifications.dart';
import 'package:torogi/presentation/screens/profile.dart';
import 'package:torogi/presentation/screens/settings.dart';
import 'package:torogi/presentation/screens/signup.dart';
import 'package:torogi/presentation/screens/job_details_screen.dart';
import 'package:torogi/presentation/widgets/custom_nav_bar.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Supabase.instance.client.auth.currentSession != null
        ? '/home'
        : '/login',
    redirect: (context, state) async {
      final user = Supabase.instance.client.auth.currentUser;
      final isAuthenticated = user != null;
      final isAuthRoute = state.matchedLocation == '/login' || state.matchedLocation == '/signup';
      final isAdminRoute = state.matchedLocation.startsWith('/admin');

      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }

      if (isAdminRoute && isAuthenticated) {
        // Fetch user's type to confirm they're an admin
        final response = await Supabase.instance.client
            .from('users')
            .select('usertype')
            .eq('id', user.id)
            .single();

        if (response == null || response['usertype'] != 'admin') {
          return '/home'; // prevent unauthorized admin access
        }
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(path: '/signup', builder: (context, state) => const Signup()),

      // Admin routes
      GoRoute(path: '/admin', builder: (context, state) => const AdminDashboard(initialPage: 'dashboard')),
      GoRoute(path: '/admin/jobs', builder: (context, state) => const AdminDashboard(initialPage: 'jobs')),
      GoRoute(path: '/admin/notifications', builder: (context, state) => const AdminDashboard(initialPage: 'notifications')),
      GoRoute(path: '/admin/settings', builder: (context, state) => const AdminDashboard(initialPage: 'settings')),

      // User routes with CustomNavBar
      ShellRoute(
        builder: (context, state, child) => CustomNavBar(child: child),
        routes: [
          GoRoute(path: '/home', builder: (context, state) => const Home()),
          GoRoute(path: '/jobs', builder: (context, state) => const JobsServices()),
          GoRoute(path: '/chats', builder: (context, state) => const ChatsScreen()),
          GoRoute(path: '/notifications', builder: (context, state) => const Notifications()),

          // Profile routes
          GoRoute(
            path: '/profile',
            builder: (context, state) => BlocProvider(
              create: (_) => ProfileBloc(ProfileRepository()),
              child: const ProfileScreen(),
            ),
          ),
          GoRoute(
            path: '/profile/:userId',
            builder: (context, state) {
              final userId = state.pathParameters['userId'] ?? '';
              return BlocProvider(
                create: (_) => ProfileBloc(ProfileRepository()),
                child: ProfileScreen(userId: userId),
              );
            },
          ),
          GoRoute(path: '/settings', builder: (context, state) => const Settings()),
        ],
      ),

      GoRoute(
        path: '/jobs/:id',
        builder: (context, state) {
          final job = state.extra as Map<String, dynamic>?;

          if (job == null) {
            return const Scaffold(
              body: Center(child: Text('Job details not found.')),
            );
          }

          return JobDetailsScreen(job: job);
        },
      ),
    ],
  );
}
