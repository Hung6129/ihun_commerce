import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildListViewControls(
  VoidCallback settingOntap,
  VoidCallback paymentOntap,
  VoidCallback favoriteOntap,
  VoidCallback achievementOntap,
) {
  return Column(
    children: [
      /// settings
      GestureDetector(
        onTap: settingOntap,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
              width: 40.w,
              height: 40.h,
              child: const Center(
                child: Icon(
                  Icons.settings,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            const Text('Settings')
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),

      /// payments
      GestureDetector(
        onTap: paymentOntap,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
              width: 40.w,
              height: 40.h,
              child: const Center(
                child: Icon(
                  Icons.payment_rounded,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            const Text('Payment Detail')
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),

      /// achievement
      GestureDetector(
        onTap: achievementOntap,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
              width: 40.w,
              height: 40.h,
              child: const Center(
                child: Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            const Text('Achievement')
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),

      /// favorite
      GestureDetector(
        onTap: favoriteOntap,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
              width: 40.w,
              height: 40.h,
              child: const Center(
                child: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            const Text('Favorite')
          ],
        ),
      )
    ],
  );
}
