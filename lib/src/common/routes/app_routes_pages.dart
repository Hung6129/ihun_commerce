import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/global.dart';

import 'package:ihun_commerce/src/views/authenticate/sign_in_page.dart';
import 'package:ihun_commerce/src/views/authenticate/sign_up_page.dart';
import 'package:ihun_commerce/src/views/authenticate/sign_up_bloc/sign_up_bloc.dart';
import 'package:ihun_commerce/src/views/main_page/bloc/main_bloc.dart';
import 'package:ihun_commerce/src/views/main_page/main_page.dart';
import 'package:ihun_commerce/src/views/profile/payment_profile/bloc/payments_bloc.dart';
import 'package:ihun_commerce/src/views/profile/payment_profile/payments_page.dart';
import 'package:ihun_commerce/src/views/profile/setting_profile/bloc/settings_bloc.dart';

import 'package:ihun_commerce/src/views/profile/setting_profile/setting_page.dart';

import '../../views/authenticate/sign_in_bloc/sign_in_bloc.dart';

import 'app_routes_name.dart';

class AppRoutesPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        routePath: AppRoutesName.SIGN_IN,
        page: const SignInPage(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        routePath: AppRoutesName.SIGN_UP,
        page: const SignUpPage(),
        bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      PageEntity(
        routePath: AppRoutesName.MAINPAGE,
        page: const MainPage(),
        bloc: BlocProvider(
          create: (context) => MainBloc(),
        ),
      ),
      PageEntity(
        routePath: AppRoutesName.SETTINGS,
        page: const SettingPage(),
        bloc: BlocProvider(
          create: (context) => SettingsBloc(),
        ),
      ),
      PageEntity(
        routePath: AppRoutesName.PAYMENTS,
        page: const PaymentsPage(),
        bloc: BlocProvider(
          create: (context) => PaymentsBloc(),
        ),
      ),
    ];
  }

  /// return all blocprovider
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviderList = <dynamic>[];
    for (var blocer in routes()) {
      blocProviderList.add(blocer.bloc);
    }
    return blocProviderList;
  }

  /// a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matching when navigator gets trigger
      var res = routes().where((element) => element.routePath == settings.name);
      bool isUserSignedIn = Global.storageServices.getIsSignedIn();
      bool openFristTime = Global.storageServices.getDeviceFirstOpen();
      if (res.isNotEmpty) {
        if (res.first.routePath == AppRoutesName.SIGN_IN && openFristTime) {
          if (isUserSignedIn) {
            return MaterialPageRoute(
                builder: (context) => const MainPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (context) => const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (context) => res.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (context) => const SignInPage(), settings: settings);
  }
}

class PageEntity {
  String routePath;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.routePath,
    required this.page,
    this.bloc,
  });
}
