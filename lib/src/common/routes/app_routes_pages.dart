import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ihun_commerce/src/views/authenticate/sign_in/sign_in_page.dart';
import 'package:ihun_commerce/src/views/authenticate/sign_up/sign_up_page.dart';
import 'package:ihun_commerce/src/views/main_page.dart';

import '../logic/authenticate/sign_in_bloc/sign_in_bloc.dart';
import '../logic/authenticate/sign_up_bloc/sign_up_bloc.dart';
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
      ),
    ];
  }

  /// return all blocprovider
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviderList = <dynamic>[];
    for (var blocer in routes()) {
      if (blocer.bloc != null) {
        blocProviderList.add(blocer.bloc);
      }
    }
    return blocProviderList;
  }

  /// a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matching when navigator gets trigger
      var res = routes().where((element) => element.routePath == settings.name);
      if (res.isNotEmpty) {
        print('vaild route name ${settings.name}');
        return MaterialPageRoute(
          builder: (_) => res.first.page,
          settings: settings,
        );
      }
    }
    print('invaild route name ${settings.name}');
    return MaterialPageRoute(
      builder: (context) => const SignInPage(),
      settings: settings,
    );
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
