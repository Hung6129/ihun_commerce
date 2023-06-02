import 'package:flutter/material.dart';
import 'package:ihun_commerce/views/cart/cart_page.dart';
import 'package:ihun_commerce/views/favorite/favorite_page.dart';
import 'package:ihun_commerce/views/home/home_page.dart';

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.home_outlined),
    label: 'Home',
    selectedIcon: Icon(Icons.home),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.search_outlined),
    label: 'Search',
    selectedIcon: Icon(Icons.search),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.favorite_outline),
    label: 'Favorite',
    selectedIcon: Icon(Icons.favorite),
  ),
];

List pageWidget = [
  const HomePage(),
  const FavoritePage(),
  const CartPage(),
];
