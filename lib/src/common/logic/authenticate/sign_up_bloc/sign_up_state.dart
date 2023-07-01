part of 'sign_up_bloc.dart';

class SignUpState {
  const SignUpState({
    this.email = "",
    this.password = "",
    this.userName = "",
    this.reTypePassword = "",
  });

  final String email;
  final String password;
  final String userName;
  final String reTypePassword;

  SignUpState copyWith({
    String? email,
    String? password,
    String? userName,
    String? reTypePassword,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      reTypePassword: reTypePassword ?? this.reTypePassword,
    );
  }
}
