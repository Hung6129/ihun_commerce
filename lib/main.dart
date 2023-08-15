import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';
import 'config/routes/app_routes_pages.dart';

Future<void> main() async {
  await Global.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [...AppRoutesPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          minTextAdapt: true,
          builder: (context, child) => MaterialApp(
            title: 'iHun E-Commerce',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
            onGenerateRoute: AppRoutesPages.generateRouteSettings,
          ),
        ),
      );
}
