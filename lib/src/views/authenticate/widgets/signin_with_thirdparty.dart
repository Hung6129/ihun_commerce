import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInWithThirdParty extends StatelessWidget {
  const SignInWithThirdParty({
    super.key,
    required this.ggSignIn,
    required this.fbSignIn,
  });

  final VoidCallback ggSignIn;
  final VoidCallback fbSignIn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: ggSignIn,
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
          onPressed: fbSignIn,
          icon: const FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.blueAccent,
          ),
          label: const Text('Facebook'),
        ),
      ],
    );
  }
}
