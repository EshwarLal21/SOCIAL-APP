import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminRepository {
  final SupabaseClient _client = Supabase.instance.client;
  
  // Stream controllers for real-time data
  final _usersController = StreamController<List<Map<String, dynamic>>>.broadcast();
  final _postsController = StreamController<List<Map<String, dynamic>>>.broadcast();
  final _servicesController = StreamController<List<Map<String, dynamic>>>.broadcast();
  final _jobsController = StreamController<List<Map<String, dynamic>>>.broadcast();

  // Getters for the streams
  Stream<List<Map<String, dynamic>>> get usersStream => _usersController.stream;
  Stream<List<Map<String, dynamic>>> get postsStream => _postsController.stream;
  Stream<List<Map<String, dynamic>>> get servicesStream => _servicesController.stream;
  Stream<List<Map<String, dynamic>>> get jobsStream => _jobsController.stream;

  AdminRepository() {
    // Initialize real-time subscriptions
    _initializeSubscriptions();
  }

  void _initializeSubscriptions() {
    // Subscribe to users table
    _client
        .from('users')
        .stream(primaryKey: ['id'])
        .listen((List<Map<String, dynamic>> data) {
      _usersController.add(data);
    });

    // Subscribe to blogs table
    _client
        .from('blogs')
        .stream(primaryKey: ['id'])
        .listen((List<Map<String, dynamic>> data) {
      _postsController.add(data);
    });

    // Subscribe to services table
    _client
        .from('services')
        .stream(primaryKey: ['id'])
        .listen((List<Map<String, dynamic>> data) {
      _servicesController.add(data);
    });

    // Subscribe to jobs table
    _client
        .from('jobs')
        .stream(primaryKey: ['id'])
        .listen((List<Map<String, dynamic>> data) {
      _jobsController.add(data);
    });
  }

  Future<Map<String, int>> getAdminStats() async {
    try {
      // Get user count
      final userCount = await _client
          .from('users')
          .select()
          .count();

      // Get post (blog) count
      final postCount = await _client
          .from('blogs')
          .select()
          .count();

      // Get service count
      final serviceCount = await _client
          .from('services')
          .select()
          .count();

      // Get job count
      final jobCount = await _client
          .from('jobs')
          .select()
          .count();

      return {
        'users': userCount.count ?? 0,
        'posts': postCount.count ?? 0,
        'services': serviceCount.count ?? 0,
        'jobs': jobCount.count ?? 0,
      };
    } catch (e) {
      throw Exception('Failed to fetch admin stats: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      final response = await _client
          .from('users')
          .select()
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch users: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getPosts() async {
    try {
      final response = await _client
          .from('blogs')
          .select()
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch posts: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getServices() async {
    try {
      final response = await _client
          .from('services')
          .select()
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch services: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getJobs() async {
    try {
      final response = await _client
          .from('jobs')
          .select()
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch jobs: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getUserReports() async {
    try {
      final response = await _client
          .from('user_reports')
          .select()
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch user reports: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getSuggestions() async {
    try {
      final response = await _client
          .from('suggestions')
          .select()
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch suggestions: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getPendingUpgrades() async {
    try {
      final response = await _client
          .from('upgrade_requests')
          .select()
          .eq('status', 'pending')
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch pending upgrades: ${e.toString()}');
    }
  }

  // Clean up resources
  void dispose() {
    _usersController.close();
    _postsController.close();
    _servicesController.close();
    _jobsController.close();
  }
} 