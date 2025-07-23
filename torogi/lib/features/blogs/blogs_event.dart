import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class FetchBlogs extends BlogEvent {
  final String category;

  const FetchBlogs(this.category);

  @override
  List<Object> get props => [category];
}

class CreateBlog extends BlogEvent {
  final String title;
  final String content;
  final String imageUrl;
  final String category;

  const CreateBlog({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.category,
  });

  @override
  List<Object> get props => [title, content, imageUrl, category];
}
