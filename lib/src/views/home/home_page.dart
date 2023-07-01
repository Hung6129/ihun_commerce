import 'package:flutter/material.dart';
import 'package:ihun_commerce/src/views/home/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: const Column(
        children: [
          CarouselWithIndicatorDemo(),
        ],
      ),
    );
  }
}
