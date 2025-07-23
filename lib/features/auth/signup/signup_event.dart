abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;
  final String username;

  SignupSubmitted(this.email, this.password, this.username);
}
