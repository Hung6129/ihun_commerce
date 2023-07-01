import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/logic/authenticate/sign_in_bloc/sign_in_bloc.dart';
import 'package:ihun_commerce/logic/authenticate/sign_up_bloc/sign_up_bloc.dart';
import 'package:ihun_commerce/utility/toast/flutter_toast.dart';

class AuthenticateRepo {
  final BuildContext context;
  const AuthenticateRepo({required this.context});

  // take email and password then hanlde sign in
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "emailAndPassword") {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          // email is emty
          toastInfor(text: "You need to fill in email address");
          return;
        }
        if (password.isEmpty) {
          // password is emty
          toastInfor(text: "You need to fill in password");
          return;
        }
        try {
          final userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (userCredential.user == null) {
            // user not exist
            toastInfor(text: "The email address don't exist");
            return;
          }
          if (!userCredential.user!.emailVerified) {
            // user not verified
            toastInfor(
                text:
                    "You haven't verify your email address.\nPlease verify your account");
            return;
          }
          var user = userCredential.user;
          if (user != null) {
            toastInfor(text: "User exist, let go to the main page");
            return;
          } else {
            toastInfor(
                text:
                    "You not a user of this app\nTry to sign up a new account");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfor(text: "No user found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfor(text: "Wrong password\nPlease try again");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfor(text: "Wrong email\nPlease try again");
            return;
          }
        }
      }
    } catch (e) {
      toastInfor(text: "Something went wrong\nPlease try again next time");
    }
  }

  Future<void> signUp() async {
    try {
      final state = context.read<SignUpBloc>().state;
      String email = state.email;
      String password = state.password;
      String userName = state.userName;
      String reTypePassword = state.reTypePassword;
      if (userName.isEmpty) {
        // userName is emty
        toastInfor(text: "You need to fill in User Name");
        return;
      }
      if (email.isEmpty) {
        // email is emty
        toastInfor(text: "You need to fill in Email address");
        return;
      }
      if (password.isEmpty) {
        // password is emty
        toastInfor(text: "You need to fill in Password");
        return;
      }
      if (reTypePassword.isEmpty) {
        // reTypePassword is emty
        toastInfor(text: "You need to retype the Password");
        return;
      }
      if (reTypePassword != password) {
        // check retype password
        toastInfor(text: "Retype password not match the password");
        return;
      }
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          await userCredential.user?.sendEmailVerification();
          await userCredential.user?.updateDisplayName(userName);
          toastInfor(
              text:
                  'An email has been sent to your email box\nPlease check and click the link to activate your account');

          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          toastInfor(text: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          toastInfor(text: 'The account already exists for that email.');
        }
      }
    } catch (e) {
      toastInfor(text: "Something went wrong\nPlease try again next time");
    }
  }
}
