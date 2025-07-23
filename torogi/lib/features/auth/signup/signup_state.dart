import '../../../data/models/user_profile.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserProfile user;
  SignupSuccess(this.user);
}

class SignupFailure extends SignupState {
  final String error;
  SignupFailure(this.error);
}
