import 'package:equatable/equatable.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminError extends AdminState {
  final String message;
  AdminError(this.message);
}

class AdminLoaded extends AdminState {
  final int userCount;
  final int postCount;
  final int serviceCount;
  final int jobCount;
  final List<Map<String, dynamic>> users;
  final List<Map<String, dynamic>> posts;
  final List<Map<String, dynamic>> services;
  final List<Map<String, dynamic>> jobs;

  AdminLoaded({
    required this.userCount,
    required this.postCount,
    required this.serviceCount,
    required this.jobCount,
    required this.users,
    required this.posts,
    required this.services,
    required this.jobs,
  });

  AdminLoaded copyWith({
    int? userCount,
    int? postCount,
    int? serviceCount,
    int? jobCount,
    List<Map<String, dynamic>>? users,
    List<Map<String, dynamic>>? posts,
    List<Map<String, dynamic>>? services,
    List<Map<String, dynamic>>? jobs,
  }) {
    return AdminLoaded(
      userCount: userCount ?? this.userCount,
      postCount: postCount ?? this.postCount,
      serviceCount: serviceCount ?? this.serviceCount,
      jobCount: jobCount ?? this.jobCount,
      users: users ?? this.users,
      posts: posts ?? this.posts,
      services: services ?? this.services,
      jobs: jobs ?? this.jobs,
    );
  }
} 