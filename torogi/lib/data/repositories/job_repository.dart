import 'package:supabase_flutter/supabase_flutter.dart';

class JobRepository {
  final _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getJobs() async {
    try {
      final response = await _client
          .from('jobs')
          .select()
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load jobs: $e');
    }
  }

  Future<void> createJob({
    required String jobTitle,
    required String jobDesc,
    required String jobLocation,
    required String contact,
    required int slots,
    required double salary,
    required DateTime postDuration,
  }) async {
    try {
      final userId = _client.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      await _client.from('jobs').insert({
        'userid': userId,
        'jobtitle': jobTitle,
        'jobdesc': jobDesc,
        'joblocation': jobLocation,
        'contact': contact,
        'slots': slots,
        'salary': salary,
        'postduration': postDuration.toIso8601String(),
        'createdat': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to create job: $e');
    }
  }

  Future<void> updateJob({
    required String jobId,
    required String jobTitle,
    required String jobDesc,
    required String jobLocation,
    required String contact,
    required int slots,
    required double salary,
    required DateTime postDuration,
  }) async {
    try {
      await _client.from('jobs').update({
        'jobtitle': jobTitle,
        'jobdesc': jobDesc,
        'joblocation': jobLocation,
        'contact': contact,
        'slots': slots,
        'salary': salary,
        'postduration': postDuration.toIso8601String(),
      }).eq('id', jobId);
    } catch (e) {
      throw Exception('Failed to update job: $e');
    }
  }

  Future<void> deleteJob(String jobId) async {
    try {
      await _client.from('jobs').delete().eq('id', jobId);
    } catch (e) {
      throw Exception('Failed to delete job: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getJobApplications(String jobId) async {
    try {
      final response = await _client
          .from('job_applications')
          .select('''
            *,
            user:userid (
              id,
              username,
              email,
              profilepic
            )
          ''')
          .eq('jobid', jobId)
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load job applications: $e');
    }
  }

  // Get all jobs
  Future<List<Map<String, dynamic>>> getAllJobs() async {
    final response = await _client
        .from('jobs')
        .select('*, user:users(*)')
        .order('createdat', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  // Get jobs by user ID
  Future<List<Map<String, dynamic>>> getJobsByUserId(String userId) async {
    try {
      final response = await _client
          .from('jobs')
          .select()
          .eq('userid', userId)
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load user jobs: $e');
    }
  }

  // Get job by ID
  Future<Map<String, dynamic>> getJobById(String jobId) async {
    try {
      final response = await _client
          .from('jobs')
          .select()
          .eq('id', jobId)
          .single();
      return response;
    } catch (e) {
      throw Exception('Failed to load job: $e');
    }
  }

  // Search jobs by title or description
  Future<List<Map<String, dynamic>>> searchJobs(String query) async {
    try {
      final response = await _client
          .from('jobs')
          .select()
          .or('jobtitle.ilike.%$query%,jobdesc.ilike.%$query%')
          .order('createdat', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to search jobs: $e');
    }
  }
}