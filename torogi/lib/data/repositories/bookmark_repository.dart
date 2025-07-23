import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookmarkRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  BookmarkRepository();

  Future<void> bookmarkPost(BuildContext context, String blogId) async {
    final currentUser = _supabase.auth.currentUser;

    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to bookmark posts')),
      );
      return;
    }

    try {
      // Check if already bookmarked
      final existingBookmark = await _supabase
          .from('blog_bookmarks')
          .select('id')
          .match({'userid': currentUser.id, 'blogid': blogId})
          .maybeSingle();

      if (existingBookmark != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post already bookmarked!')),
        );
        return;
      }

      // Insert new bookmark
      await _supabase.from('blog_bookmarks').insert({
        'userid': currentUser.id,
        'blogid': blogId,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post bookmarked!')),
      );
    } catch (e) {
      debugPrint('Error bookmarking post: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error bookmarking post: $e')),
      );
    }
  }

  Future<void> removeBookmark(String blogId) async {
    final currentUser = _supabase.auth.currentUser;
    if (currentUser == null) return;

    await _supabase
        .from('blog_bookmarks')
        .delete()
        .match({'userid': currentUser.id, 'blogid': blogId});
  }

  Future<bool> isPostBookmarked(String blogId) async {
    final currentUser = _supabase.auth.currentUser;
    if (currentUser == null) return false;

    final result = await _supabase
        .from('blog_bookmarks')
        .select('id')
        .match({'userid': currentUser.id, 'blogid': blogId})
        .maybeSingle();

    return result != null;
  }

  Stream<List<String>> watchBookmarkedPosts() {
    final currentUser = _supabase.auth.currentUser;
    if (currentUser == null) return const Stream.empty();

    return _supabase
        .from('blog_bookmarks')
        .stream(primaryKey: ['id'])
        .eq('userid', currentUser.id)
        .order('createdat', ascending: false)
        .map((rows) => rows.map((row) => row['blogid'] as String).toList());
  }
}
