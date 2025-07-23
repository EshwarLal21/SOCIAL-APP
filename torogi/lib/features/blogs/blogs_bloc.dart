import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/repositories/blog_repository.dart';
import 'blogs_event.dart';
import 'blogs_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final _supabase = Supabase.instance.client;
  final BlogRepository _blogRepository = BlogRepository();

  BlogBloc() : super(BlogInitial()) {
    on<FetchBlogs>(_onFetchBlogs);
    on<CreateBlog>(_onCreateBlog);
  }

  Future<void> _onFetchBlogs(FetchBlogs event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      final blogs = await _blogRepository.getBlogs();
      emit(BlogLoaded(blogs));
    } catch (e) {
      emit(BlogError(e.toString()));
    }
  }

  Future<void> _onCreateBlog(CreateBlog event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      await _supabase.from('blogs').insert({
        'userid': _supabase.auth.currentUser!.id,
        'title': event.title,
        'description': event.content,
        'image': event.imageUrl,
        'category': event.category.toLowerCase(),
        'blograting': 0,
        'createdat': DateTime.now().toIso8601String(),
      });

      add(FetchBlogs(event.category));
    } catch (e) {
      emit(BlogError(e.toString()));
    }
  }

  @override
  Future<void> close() {
   // _blogRepository.dispose();
    return super.close();
  }
}
