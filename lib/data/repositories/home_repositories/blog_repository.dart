import 'package:supabase_flutter/supabase_flutter.dart';

class BlogRepository {
  final _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchBlogs(String category) async {
    final response = await _client
        .from('blogs')
        .select('title, description, image')
        .eq('category', category)
        .limit(10);

    List<Map<String, dynamic>> blogs = List<Map<String, dynamic>>.from(response);

    if (blogs.isEmpty) {
      final fallback = await _client
          .from('blogs')
          .select('title, description, image')
          .order('blogRating', ascending: false)
          .order('createdAt', ascending: false)
          .limit(10);
      blogs = List<Map<String, dynamic>>.from(fallback);
    }

    return blogs;
  }
}
