import 'package:app_challenge/features/home/presenter/pages/home_page.dart';
import 'package:app_challenge/features/login/presenter/pages/login_page.dart';
import 'package:flutter/material.dart';

enum RoutesNamed {
  home('/'),
  login('/login'),
  initial('/login');

  const RoutesNamed(this.route);

  final String route;
}

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesNamed.home.route: (context) => const HomePage(),
      RoutesNamed.login.route: (context) => const LoginPage(),
    };
  }
}
