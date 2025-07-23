import 'package:equatable/equatable.dart';
import '../../../data/models/user_profile.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserProfile? user;
  final bool isAdmin;

  const LoginSuccess({
    this.user,
    required this.isAdmin,
  });

  @override
  List<Object?> get props => [user, isAdmin];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
