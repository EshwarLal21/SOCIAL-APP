import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;

  SignupBloc(this.authRepository) : super(SignupInitial()) {
    on<SignupSubmitted>((event, emit) async {
      emit(SignupLoading());
      try {
        final user = await authRepository.signUp(event.email, event.password, event.username);
        emit(SignupSuccess(user));
      } catch (e) {
        emit(SignupFailure(e.toString()));
      }
    });
  }
}
