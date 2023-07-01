import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ihun_commerce/logic/authenticate/repo/authenticate_repo.dart';
import 'package:ihun_commerce/logic/authenticate/sign_up_bloc/sign_up_bloc.dart';

import 'package:ihun_commerce/views/authenticate/sign_in/sign_in_page.dart';
import 'package:ihun_commerce/views/authenticate/widgets/cus_auth_nav_sign.dart';

import 'package:ihun_commerce/views/authenticate/widgets/cus_divider.dart';
import 'package:ihun_commerce/views/authenticate/widgets/cus_textfeild.dart';
import 'package:ihun_commerce/views/authenticate/widgets/forgot_password.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reTypePasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                'Creating new account for\nihunEcommerce',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.sp),
              ),
            ),
            CusTextFeild(
                onChange: (value) {
                  context.read<SignUpBloc>().add(UserNameEvent(value));
                },
                controller: _usernameController,
                lblText: 'Enter your username',
                iconData: Icons.person),
            CusTextFeild(
                onChange: (value) {
                  context.read<SignUpBloc>().add(EmailEvent(value));
                },
                controller: _emailController,
                lblText: 'Enter your email',
                iconData: Icons.email_rounded),
            CusTextFeild(
                onChange: (value) {
                  context.read<SignUpBloc>().add(PasswordEvent(value));
                },
                controller: _passwordController,
                lblText: 'Enter your passwod',
                txtfType: 'password',
                iconData: Icons.password_rounded),
            CusTextFeild(
                onChange: (value) {
                  context.read<SignUpBloc>().add(RePasswordEvent(value));
                },
                controller: _reTypePasswordController,
                lblText: 'Retype your passwod',
                txtfType: 'password',
                iconData: Icons.password_rounded),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  AuthenticateRepo(context: context).signUp();
                },
                icon: const FaIcon(FontAwesomeIcons.key),
                label: const Text('Sign Up')),
            ForgotPassword(
              ontap: () {},
            ),
            const CusDivider(),
            const CusAuthNav(authNavType: '', navTo: SignInPage())
          ],
        ),
      ),
    );
  }
}
