import 'package:flutter/material.dart';
import '../resources/manager_strings.dart';

/// A class defined for all routes constants
class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      //@Todo: Complete this
      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => const SplashView());
      default:
        return unDefinedRoute();
    }
  }

  /// If PushNamed Failed Return This Page With No Actions
  /// This Screen Will Tell The User This Page Is Not Exist
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            ManagerStrings.noRouteFound,
          ),
        ),
        body: Center(
          child: Text(
            ManagerStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
