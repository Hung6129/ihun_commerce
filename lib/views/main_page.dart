import 'package:flutter/material.dart';
import 'package:ihun_commerce/utility/helpers/components.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navDrawerIndex = 0;
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
