import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/core/theme/app_theme.dart';
import 'package:torogi/data/repositories/admin_repository.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'package:torogi/data/repositories/home_repositories/blog_repository.dart';
import 'package:torogi/data/repositories/home_repositories/service_repository.dart';
import 'package:torogi/data/repositories/home_repositories/user_repository.dart';
import 'package:torogi/data/repositories/job_repository.dart';
import 'package:torogi/features/admin/admin_bloc.dart';
import 'package:torogi/features/auth/login/login_bloc.dart';
import 'package:torogi/features/auth/signup/signup_bloc.dart';
import 'package:torogi/features/blogs/blogs_bloc.dart';
import 'package:torogi/features/jobs/jobs_bloc.dart';
import 'package:torogi/features/services/services_bloc.dart';
import 'package:torogi/features/users/users_bloc.dart';
import 'package:torogi/presentation/widgets/theme.dart';
import 'package:torogi/router/app_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

import 'data/local/database/app_database.dart';
import 'data/repositories/profile_repository.dart';
import 'features/profile/profile_bloc.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await dotenv.load(fileName: "assets/.env");

  await Supabase.initialize(
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzZnVsa3RpZHRoZmJkeWZ5aWV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxODI4NDksImV4cCI6MjA2NTc1ODg0OX0.IK5FwWyfm73fZWrkQKXs5z-HPukzScA2uz5IQvO7j90',
    url: 'https://isfulktidthfbdyfyiex.supabase.co',
  );

  // Initialize Mobile Ads only on mobile platforms
  if (Platform.isAndroid || Platform.isIOS) {
    await MobileAds.instance.initialize();
    // Optional: Set test device IDs
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: ['ca-app-pub-3940256099942544~3347511713']),
    );
  }

  // Dependency Injection Setup
  _setupDependencies();

  runApp(const MainApp());
}

void _setupDependencies() {
  // Database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Repositories
  getIt.registerSingleton<AuthRepository>(AuthRepository());
  getIt.registerSingleton<BlogRepository>(BlogRepository());
  getIt.registerSingleton<ServiceRepository>(ServiceRepository());
  getIt.registerSingleton<UserRepository>(UserRepository());
  getIt.registerSingleton<JobRepository>(JobRepository());
  getIt.registerSingleton<AdminRepository>(AdminRepository());
  getIt.registerSingleton<ProfileRepository>(ProfileRepository()); // 👈 added this



  // BLoCs
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt<AuthRepository>()));
  getIt.registerFactory<SignupBloc>(() => SignupBloc(getIt<AuthRepository>()));
  getIt.registerFactory<ProfileBloc>(() => ProfileBloc(getIt<ProfileRepository>()));

  getIt.registerFactory<BlogBloc>(() => BlogBloc());

  getIt.registerFactory<ServiceBloc>(() => ServiceBloc(getIt<ServiceRepository>()));
  getIt.registerFactory<UserBloc>(() => UserBloc(getIt<UserRepository>()));
  getIt.registerFactory<JobsBloc>(() => JobsBloc(getIt<JobRepository>()));
  getIt.registerFactory<AdminBloc>(() => AdminBloc(getIt<AdminRepository>()));


}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => getIt<AuthRepository>()),
        RepositoryProvider<BlogRepository>(create: (_) => getIt<BlogRepository>()),
        RepositoryProvider<ServiceRepository>(create: (_) => getIt<ServiceRepository>()),
        RepositoryProvider<UserRepository>(create: (_) => getIt<UserRepository>()),
        RepositoryProvider<JobRepository>(create: (_) => getIt<JobRepository>()),
        RepositoryProvider<AppDatabase>(create: (_) => getIt<AppDatabase>()),
        RepositoryProvider<AdminRepository>(create: (_) => getIt<AdminRepository>()),
      ],
      child: MultiBlocProvider(
        providers: [

          BlocProvider(create: (context) => getIt<LoginBloc>()),
          BlocProvider(create: (context) => getIt<ProfileBloc>()), // 👈 here

          BlocProvider(create: (context) => getIt<SignupBloc>()),
          BlocProvider(create: (context) => getIt<BlogBloc>()),
          BlocProvider(create: (context) => getIt<ServiceBloc>()),
          BlocProvider(create: (context) => getIt<UserBloc>()),
          BlocProvider(create: (context) => getIt<JobsBloc>()),
          BlocProvider(create: (context) => getIt<AdminBloc>()),
          BlocProvider(create: (context) => getIt<ProfileBloc>()), // 👈 added here

          BlocProvider(create: (_) => ThemeCubit()), // 👈 add this
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme().lightTheme,
              darkTheme: AppTheme().darkTheme,
              themeMode: themeMode,
              routerConfig: AppRouter.router,
            );
          },
        ),

      ),
    );
  }
}