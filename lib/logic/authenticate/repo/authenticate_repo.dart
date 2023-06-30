import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/logic/authenticate/sign_in_bloc/sign_in_bloc.dart';
import 'package:ihun_commerce/utility/toast/flutter_toast.dart';

class AuthenticateRepo {
  final BuildContext context;
  const AuthenticateRepo({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "emailAndPassword") {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          // email is emty
          toastInfor(text: "You need to fill in email address");
        }
        if (password.isEmpty) {
          // password is emty
          toastInfor(text: "You need to fill in password");
        }
        try {
          final userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (userCredential.user == null) {
            // user not exist
            toastInfor(text: "The email address don't exist");
          }
          if (!userCredential.user!.emailVerified) {
            // user not verified
            toastInfor(
                text:
                    "You haven't verify your email address.\nPlease verify your account");
          }
          var user = userCredential.user;
          if (user != null) {
            toastInfor(text: "User exist, let go to the main page");
          } else {
            toastInfor(
                text:
                    "You not a user of this app\nTry to sign up a new account");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfor(text: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfor(text: "Wrong password\nPlease try again");
          } else if (e.code == 'invalid-email') {
            toastInfor(text: "Wrong email\nPlease try again");
          }
        }
      }
    } catch (e) {
      toastInfor(text: "Something went wrong\nPlease try again next time");
    }
  }

  Future<void> signUp(String emailAddress, String password) async {
    try {
      final userCre =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print('Done sign up with ${userCre.user!.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
