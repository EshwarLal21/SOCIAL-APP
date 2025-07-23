import 'package:supabase_flutter/supabase_flutter.dart';

class ServicesRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Get all services
  Future<List<Map<String, dynamic>>> getServices() async {
    final response = await _supabase
        .from('services')
        .select()
        .order('createdat', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  // Get featured services (latest 7 services)
  Future<List<Map<String, dynamic>>> getFeaturedServices() async {
    final response = await _supabase
        .from('services')
        .select()
        .order('createdat', ascending: false)
        .limit(7);
    
    return List<Map<String, dynamic>>.from(response);
  }

  // Get service applications for a specific service
  Future<List<Map<String, dynamic>>> getServiceApplications(String serviceId) async {
    final response = await _supabase
        .from('service_applications')
        .select('*, users(username, email)')
        .eq('serviceid', serviceId);
    return List<Map<String, dynamic>>.from(response);
  }

  // Get user's service applications
  Future<List<Map<String, dynamic>>> getUserServiceApplications() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final response = await _supabase
        .from('service_applications')
        .select('*, services(*)')
        .eq('userid', userId);
    return List<Map<String, dynamic>>.from(response);
  }

  // Apply for a service
  Future<void> applyForService(String serviceId, String message) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not authenticated');

    await _supabase.from('service_applications').insert({
      'serviceid': serviceId,
      'userid': userId,
      'message': message,
      'status': 'applied'
    });
  }

  // Update service application status
  Future<void> updateApplicationStatus(String applicationId, String status) async {
    await _supabase
        .from('service_applications')
        .update({'status': status})
        .eq('id', applicationId);
  }

  // Delete service application
  Future<void> deleteApplication(String applicationId) async {
    await _supabase
        .from('service_applications')
        .delete()
        .eq('id', applicationId);
  }

  // Check if user has already applied
  Future<bool> hasUserApplied(String serviceId) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    final response = await _supabase
        .from('service_applications')
        .select()
        .eq('serviceid', serviceId)
        .eq('userid', userId)
        .limit(1);
    
    return (response as List).isNotEmpty;
  }
} 