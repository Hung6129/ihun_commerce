import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ihun_commerce/src/views/cart/cart_page.dart';
import 'package:ihun_commerce/src/views/favorite/favorite_page.dart';
import 'package:ihun_commerce/src/views/home/home_page.dart';
import 'package:ihun_commerce/src/views/main_page/bloc/main_bloc.dart';
import 'package:ihun_commerce/src/views/profile/profile_page.dart';

import '../../common/helpers/components.dart';

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
          selectedIndex: navDrawerIndex,
          destinations: appBarDestinations,
        ),
      ),
    );
  }
}
