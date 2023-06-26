import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_commerce/data/services/shopping_repo.dart';
import 'package:ihun_commerce/logic/cart_bloc/cart_bloc.dart';
import 'package:ihun_commerce/logic/products_bloc/products_bloc.dart';
import 'package:ihun_commerce/utility/helpers/color_seed.dart';
import 'package:ihun_commerce/views/authenticate/sign_in/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool useMaterial3 = true;
  ThemeMode themeMode = ThemeMode.system;
  ColorSeed colorSelected = ColorSeed.baseColor;

  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void handleColorSelect(int value) {
    setState(() {
      colorSelected = ColorSeed.values[value];
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final shoppingRepository = ShoppingRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc()
            ..add(
              LoadListProducts(),
            ),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        )
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'iHun E-Commerce',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: ThemeData(
            colorSchemeSeed: colorSelected.color,
            useMaterial3: useMaterial3,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            colorSchemeSeed: colorSelected.color,
            useMaterial3: useMaterial3,
            brightness: Brightness.dark,
          ),
          home: const SignInPage(),
          // MainPage(
          //   useLightMode: useLightMode,
          //   useMaterial3: useMaterial3,
          //   colorSelected: colorSelected,
          //   handleBrightnessChange: handleBrightnessChange,
          //   handleColorSelect: handleColorSelect,
          // ),
        ),
      ),
    );
  }
}
