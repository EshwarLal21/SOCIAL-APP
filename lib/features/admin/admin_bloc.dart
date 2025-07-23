import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/data/repositories/admin_repository.dart';
import 'admin_event.dart';
import 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository repository;

  AdminBloc(this.repository) : super(AdminInitial()) {
    on<LoadAdminDashboard>((event, emit) async {
      emit(AdminLoading());
      
      try {
        final stats = await repository.getAdminStats();
        final users = await repository.getUsers();
        final posts = await repository.getPosts();
        final services = await repository.getServices();
        final jobs = await repository.getJobs();
        
        emit(AdminLoaded(
          userCount: stats['users'] ?? 0,
          postCount: stats['posts'] ?? 0,
          serviceCount: stats['services'] ?? 0,
          jobCount: stats['jobs'] ?? 0,
          users: users,
          posts: posts,
          services: services,
          jobs: jobs,
        ));
      } catch (e) {
        emit(AdminError(e.toString()));
      }
    });
  }
} 