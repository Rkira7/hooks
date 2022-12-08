import 'package:flutter/material.dart';
import 'package:inicialhooks/Pages/FormPage.dart';
import 'package:inicialhooks/Pages/countPage.dart';
import 'package:inicialhooks/Pages/homePage.dart';
import 'package:inicialhooks/Pages/scrollPage.dart';

class Routes {
  static const String homepage = "/";
  static const String counter = "/count";
  static const String form = "/form";
  static const String scroll = "/scroll";


  static Route routes(RouteSettings routeSettings) {
    print('Route name: ${routeSettings.name}');
    print("arguments: ${routeSettings.arguments}");

    switch (routeSettings.name) {
      case homepage:
        return _buildRoute(HomePage());
      case counter:
        return _buildRoute(CountPage(routeSettings.arguments.toString()));
      case form:
        return _buildRoute(FormPage(routeSettings.arguments.toString()));
      case scroll:
        return _buildRoute(ScrollPage(routeSettings.arguments.toString()));
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Widget widget) => MaterialPageRoute(builder: (_) => widget);
}