import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_commerce/src/common/routes/app_routes_name.dart';
import 'package:ihun_commerce/src/views/profile/widgets/profile_page_widgets.dart';

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
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ],
      ),
      body: Padding(
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
    );
  }
}
