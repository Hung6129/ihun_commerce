import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ihun_commerce/logic/authenticate/repo/authenticate_repo.dart';
import 'package:ihun_commerce/logic/authenticate/sign_in_bloc/sign_in_bloc.dart';
import 'package:ihun_commerce/views/authenticate/sign_up/sign_up_page.dart';

import 'package:ihun_commerce/views/authenticate/widgets/cus_auth_nav_sign.dart';
import 'package:ihun_commerce/views/authenticate/widgets/cus_divider.dart';
import 'package:ihun_commerce/views/authenticate/widgets/cus_textfeild.dart';
import 'package:ihun_commerce/views/authenticate/widgets/forgot_password.dart';
import 'package:ihun_commerce/views/authenticate/widgets/signin_with_thirdparty.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                'Welcome to\nihunEcommerce',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.sp),
              ),
            ),
            CusTextFeild(
              onChange: (value) =>
                  context.read<SignInBloc>().add(SignInEmail(value)),
              controller: _emailController,
              lblText: 'Enter your email',
              iconData: Icons.email,
            ),
            CusTextFeild(
              onChange: (value) =>
                  context.read<SignInBloc>().add(SignInPassword(value)),
              controller: _passwordController,
              lblText: 'Enter your password',
              iconData: Icons.lock,
              txtfType: 'password',
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  AuthenticateRepo(context: context)
                      .handleSignIn("emailAndPassword");
                },
                icon: const FaIcon(FontAwesomeIcons.arrowRightToBracket),
                label: const Text('Sign In')),
            ForgotPassword(
              ontap: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: const Text('Or sign in with'),
            ),
            SignInWithThirdParty(ggSignIn: () {}, fbSignIn: () {}),
            const CusDivider(),
            const CusAuthNav(authNavType: 'signIn', navTo: SignUpPage())
          ],
        ),
      ),
    );
  }
}
