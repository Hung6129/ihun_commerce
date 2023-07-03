import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusTextFeild extends StatelessWidget {
  const CusTextFeild({
    super.key,
    required this.controller,
    required this.lblText,
    required this.iconData,
    this.txtfType = 'text',
    required this.onChange,
  });
  final Function(String value) onChange;
  final String txtfType;
  final TextEditingController controller;
  final String lblText;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextField(
        onChanged: onChange,
        controller: controller,
        obscureText: txtfType == 'password' ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          suffixIcon: ClearButton(controller: controller),
          labelText: lblText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          controller.clear();
        },
      );
}
