import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar homeAppBar() {
  return AppBar(
    actions: [
      const CircleAvatar(),
      SizedBox(
        width: 20.w,
      )
    ],
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.menu_rounded,
      ),
    ),
  );
}
