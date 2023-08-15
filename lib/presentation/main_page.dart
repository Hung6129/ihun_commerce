import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_commerce/config/styles/palettes.dart';
import 'package:ihun_commerce/presentation/search/search_page.dart';

import '../bloc/main_bloc/main_bloc.dart';

import 'cart/cart_page.dart';
import 'favorite/favorite_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab = 0;
  List screens = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const CartPage(),
    const ProfilePage(),
  ];
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) => Scaffold(
        body: screens[_selectedTab],
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Palettes.p1,
              borderRadius: BorderRadius.circular(18.r),
            ),
            padding: EdgeInsets.all(10.h),
            margin: EdgeInsets.symmetric(horizontal: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconButton(Icons.home, _selectedTab, 0, () {
                  _handleIndexChanged(0);
                }),
                iconButton(Icons.search, _selectedTab, 1, () {
                  _handleIndexChanged(1);
                }),
                iconButton(Icons.favorite, _selectedTab, 2, () {
                  _handleIndexChanged(2);
                }),
                iconButton(Icons.shopping_bag, _selectedTab, 3, () {
                  _handleIndexChanged(3);
                }),
                iconButton(Icons.person, _selectedTab, 4, () {
                  _handleIndexChanged(4);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget iconButton(
    IconData icon, int selectedIndex, int indexTab, VoidCallback onTap) {
  return SizedBox(
    height: 30.h,
    width: 30.w,
    child: IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: selectedIndex == indexTab
            ? Colors.white
            : Colors.white.withOpacity(0.3),
      ),
    ),
  );
}
