import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'package:torogi/features/auth/login/login_event.dart';
import 'package:torogi/features/auth/login/login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async{
      emit(LoginLoading());
      try {
        // Login the user using the AuthRepository
        final user = await _authRepository.login(event.email, event.password);
        
        // The login method in AuthRepository already handles admin checking
        // and updates the user type accordingly
        emit(LoginSuccess(
          user: user, 
          isAdmin: user.userType == 'admin'
        ));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
