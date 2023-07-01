import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
    required this.ontap,
  });

  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: GestureDetector(
        onTap: ontap,
        child: Text("Forgot password?",
            style: TextStyle(
              fontSize: 15.sp,
              decoration: TextDecoration.underline,
            )),
      ),
    );
  }
}
