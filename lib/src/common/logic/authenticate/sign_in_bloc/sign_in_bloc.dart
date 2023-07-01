import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEmail>(_onSignInEmail);
    on<SignInPassword>(_onSignInPassword);
  }

  void _onSignInPassword(SignInPassword event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onSignInEmail(SignInEmail event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }
}
