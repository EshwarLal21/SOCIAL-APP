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

import '../data/repositories/admin_repository.dart';
import '../presentation/screens/admin_upgrade_approve.dart';
import '../presentation/screens/banner_upgrade.dart';
import '../presentation/screens/change_password.dart';
import '../presentation/screens/contribution_page.dart';
import '../presentation/screens/forgot_password.dart';
import '../presentation/screens/splash_screen.dart';
import '../presentation/screens/user_reports.dart';
final navigatorKey = GlobalKey<NavigatorState>();


class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,   // ✅ This is now added here!
    initialLocation: '/splash',
      redirect: (context, state) async {
        final user = Supabase.instance.client.auth.currentUser;
        final isAuthenticated = user != null;
        final isAuthRoute = state.matchedLocation == '/login' ||
            state.matchedLocation == '/signup' ||
            state.matchedLocation == '/forgot-password';
        final isSplashRoute = state.matchedLocation == '/splash';
        final isAdminRoute = state.matchedLocation.startsWith('/admin');
        final needsAuthRoute = [
          '/contribute',
          '/upgrade-banner',
          '/chats',
          '/notifications',
        ].contains(state.matchedLocation);

        if (isSplashRoute) return null;

        if (isAuthenticated) {
          final isAdminEmail = user.email?.toLowerCase() == 'torogi.app@gmail.com';

          final response = await Supabase.instance.client
              .from('users')
              .select('usertype')
              .eq('id', user.id)
              .maybeSingle();

          final isAdmin = isAdminEmail || (response != null && response['usertype'] == 'admin');




          if (isAdminRoute && !isAdmin) {
            return '/home';
          }
        } else {

        }

        return null;
      },

      routes: [

        GoRoute(
          path: '/admin/upgrade-requests',
          builder: (context, state) => const AdminUpgradeRequestsScreen(),
        ),


        GoRoute(
          path: '/admin/reports',
          builder: (context, state) => const UserReportsScreen(),
        ),

        GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(path: '/signup', builder: (context, state) => const Signup()),
      GoRoute(path: '/forgot-password', builder: (context, state) => ForgotScreen()),
     // GoRoute(path: '/reset-password', builder: (context, state) =>  ResetScreen()),
      GoRoute(path: '/admin', builder: (context, state) => const AdminDashboard(initialPage: 'dashboard')),
      GoRoute(path: '/admin/jobs', builder: (context, state) => const AdminDashboard(initialPage: 'jobs')),
      GoRoute(path: '/admin/notifications', builder: (context, state) => const AdminDashboard(initialPage: 'notifications')),
      GoRoute(path: '/admin/settings', builder: (context, state) => const AdminDashboard(initialPage: 'settings')),
      ShellRoute(
        builder: (context, state, child) => CustomNavBar(child: child),
        routes: [
          GoRoute(path: '/home', builder: (context, state) => const Home()),
          GoRoute(path: '/jobs', builder: (context, state) => const JobsServices()),
          GoRoute(path: '/chats', builder: (context, state) => const ChatsScreen()),
          GoRoute(path: '/notifications', builder: (context, state) => const Notifications()),
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
            return const Scaffold(body: Center(child: Text('Job details not found.')));
          }
          return JobDetailsScreen(job: job);
        },
      ),
      GoRoute(
        path: '/contribute',
        builder: (context, state) {
          final userId = Supabase.instance.client.auth.currentUser!.id;
          return ContributionPage(userId: userId);
        },
      ),
      GoRoute(
        path: '/upgrade-banner',
        builder: (context, state) {
          final userId = Supabase.instance.client.auth.currentUser!.id;
          return BannerUpgradePage(userId: userId);
        },
      ),
    ],
  );
}
