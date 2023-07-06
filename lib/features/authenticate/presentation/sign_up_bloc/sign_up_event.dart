part of 'sign_up_bloc.dart';

class SignUpEvent {
  const SignUpEvent();
}

class UserNameEvent extends SignUpEvent {
  final String userName;

  const UserNameEvent(this.userName);
}

class EmailEvent extends SignUpEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;

  const PasswordEvent(this.password);
}

class RePasswordEvent extends SignUpEvent {
  final String reTypePassword;

  const RePasswordEvent(this.reTypePassword);
}
