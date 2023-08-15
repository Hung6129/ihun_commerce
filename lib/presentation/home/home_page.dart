import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/home_page_widgets.dart';

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
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CarouselWithIndicatorDemo(),
            ),
            SliverToBoxAdapter(
              child: menuText(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              sliver: sliverGridProductItem(
                imgList,
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
