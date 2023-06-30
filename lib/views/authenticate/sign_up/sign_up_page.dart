import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ihun_commerce/views/authenticate/sign_in/sign_in_page.dart';
import 'package:ihun_commerce/views/authenticate/widgets/clear_btn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Center(
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_rounded),
                  suffixIcon: ClearButton(controller: _usernameController),
                  labelText: 'Type your username',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Center(
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: ClearButton(controller: _emailController),
                  labelText: 'Type your email',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Center(
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: ClearButton(controller: _passwordController),
                  labelText: 'Type your password',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.key),
              label: const Text('Sign Up')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              indent: 30.w,
              endIndent: 30.w,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Already have account? '),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                        (route) => false,
                      );
                    },
                  text: ' Sign in here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
