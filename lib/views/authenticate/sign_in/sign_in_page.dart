import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ihun_commerce/views/authenticate/sign_up/sign_up_page.dart';
import 'package:ihun_commerce/views/authenticate/widgets/clear_btn.dart';

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              'Welcome to\nihunEcommerce',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.sp),
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
              icon: const FaIcon(FontAwesomeIcons.arrowRightToBracket),
              label: const Text('Sign In')),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: const Text('Or sign in with'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.redAccent,
                ),
                label: const Text('Google'),
              ),
              SizedBox(
                width: 10.w,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blueAccent,
                ),
                label: const Text('Facebook'),
              ),
            ],
          ),
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
                const TextSpan(text: 'Do not have account yet? '),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                          (route) => false);
                    },
                  text: ' Sign up here',
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
