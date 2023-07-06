import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/palettes.dart';
import '../../../config/text_styles.dart';


Widget buildListViewControls(
  VoidCallback settingOntap,
  VoidCallback paymentOntap,
  VoidCallback favoriteOntap,
  VoidCallback achievementOntap,
) {
  return Column(
    children: [
      listItem(settingOntap, Icons.settings, 'Settings'),
      listItem(paymentOntap, Icons.payment, 'Payments'),
      listItem(favoriteOntap, Icons.favorite, 'Favorites'),
      listItem(achievementOntap, Icons.star, 'Achievements'),
    ],
  );
}

Widget listItem(
  VoidCallback func,
  IconData iconData,
  String title,
) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20.h),
    child: GestureDetector(
      onTap: func,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Palettes.p1,
              borderRadius: BorderRadius.circular(
                10.h,
              ),
            ),
            width: 50.w,
            height: 40.h,
            child: Center(
              child: Icon(iconData, color: Palettes.textWhite, size: 30.h),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(title, style: TextStyles.defaultStyle.setTextSize(15.sp))
        ],
      ),
    ),
  );
}

PreferredSizeWidget profileAppBar(VoidCallback meunTapped) {
  return AppBar(
    title: Text('Profile', style: TextStyles.defaultStyle.appBarTitle.bold),
    actions: [
      IconButton(
        onPressed: meunTapped,
        icon: const Icon(Icons.more_vert_rounded),
      ),
    ],
  );
}
