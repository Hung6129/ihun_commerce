part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmail extends SignInEvent {
  final String email;
  const SignInEmail(this.email);
}

class SignInPassword extends SignInEvent {
  final String password;
  const SignInPassword(this.password);
}
