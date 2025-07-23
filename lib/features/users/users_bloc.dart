import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/data/repositories/home_repositories/user_repository.dart';
import 'users_event.dart';
import 'users_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<LoadFeaturedUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchFeaturedUsers(event.userId);
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError('Failed to load users'));
      }
    });
  }
}
