import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusAuthNav extends StatelessWidget {
  const CusAuthNav({
    super.key,
    required this.authNavType,
    required this.navTo,
  });

  final String authNavType;
  final Widget navTo;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: authNavType == 'signIn'
                ? 'Do not have account yet? '
                : 'Already have account? ',
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => navTo,
                  ),
                  (route) => false,
                );
              },
            text: authNavType == 'signIn' ? ' Sign up here ' : ' Sign in here',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
