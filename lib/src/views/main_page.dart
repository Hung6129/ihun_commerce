import 'package:flutter/material.dart';

import 'package:ihun_commerce/src/views/cart/cart_page.dart';
import 'package:ihun_commerce/src/views/favorite/favorite_page.dart';
import 'package:ihun_commerce/src/views/home/home_page.dart';
import 'package:ihun_commerce/src/views/settings/setting_page.dart';

import '../common/helpers/components.dart';

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
      const CartPage(),
      const SettingPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageWidget[navDrawerIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (selectedIndex) {
          setState(() {
            navDrawerIndex = selectedIndex;
          });
        },
        selectedIndex: navDrawerIndex,
        destinations: appBarDestinations,
      ),
    );
  }
}
