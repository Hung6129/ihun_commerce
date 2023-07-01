part of 'sign_in_bloc.dart';

class SignInEvent {
  const SignInEvent();
}

class SignInEmail extends SignInEvent {
  final String email;
  const SignInEmail(this.email);
}

class SignInPassword extends SignInEvent {
  final String password;
  const SignInPassword(this.password);
}
