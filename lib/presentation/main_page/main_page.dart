import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_commerce/presentation/main_page/components.dart';

import '../../config/styles/palettes.dart';
import '../favorite/favorite_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import 'bloc/main_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navDrawerIndex = 0;
  var pageWidget = [];
  @override
  void initState() {
    super.initState();
    pageWidget = [
      const HomePage(),
      const FavoritePage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) => Scaffold(
        body: pageWidget[navDrawerIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (selectedIndex) {
            setState(() {
              navDrawerIndex = selectedIndex;
            });
          },
          height: 55.h,
          indicatorColor: Palettes.p3,
          surfaceTintColor: Palettes.textWhite,
          selectedIndex: navDrawerIndex,
          destinations: appBarDestinations,
        ),
      ),
    );
  }
}
