abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;
  final String username;
  final String userType; // New field

  SignupSubmitted(this.email, this.password, this.username, this.userType);
}
