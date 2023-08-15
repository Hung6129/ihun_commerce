import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_commerce/config/routes/app_routes_name.dart';
import 'package:ihun_commerce/config/styles/text_styles.dart';

import 'widgets/profile_page_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(() {}),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
          ),
          Text('John Doe', style: TextStyles.customStyle.bold.mediumText),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(10.h),
            child: buildListViewControls(
              () {
                Navigator.of(context).pushNamed(AppRoutesName.SETTINGS);
              },
              () {
                Navigator.of(context).pushNamed(AppRoutesName.PAYMENTS);
              },
              () {},
              () {},
            ),
          ),
        ],
      ),
    );
  }
}
