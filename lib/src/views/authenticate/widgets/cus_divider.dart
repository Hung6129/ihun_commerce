import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusDivider extends StatelessWidget {
  const CusDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Divider(
        indent: 20.w,
        endIndent: 20.w,
        thickness: 1,
      ),
    );
  }
}
