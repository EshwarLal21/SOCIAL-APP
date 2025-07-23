import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceRepository {
  final _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchServicesByCategory(String category) async {
    final response = await _client
        .from('services')
        .select('''
          id, 
          userid,
          company, 
          servicedesc, 
          companylocation, 
          serviceimage, 
          servicetype, 
          salary, 
          servicerating, 
          contact,
          createdat
        ''')
        .eq('servicetype', category)
        .order('createdat', ascending: false);

    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> fetchAllServices() async {
    final response = await _client
        .from('services')
        .select('''
          id, 
          userid,
          company, 
          servicedesc, 
          companylocation, 
          serviceimage, 
          servicetype, 
          salary, 
          servicerating, 
          contact,
          createdat
        ''')
        .order('createdat', ascending: false)
        .limit(7);

    return List<Map<String, dynamic>>.from(response);
  }
}