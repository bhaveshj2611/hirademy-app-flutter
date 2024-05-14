import 'package:flutter/material.dart';
import 'package:hirademy_flutter_bhavesh/routes/route_name.dart';
import 'package:hirademy_flutter_bhavesh/screens/book_details.dart';
import 'package:hirademy_flutter_bhavesh/screens/book_lists.dart';
import 'package:hirademy_flutter_bhavesh/screens/splash_screen.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteName.splash:
          return const SplashScreen();

        case RouteName.bookLists:
          return const BookList();

        case RouteName.bookDetails:
          return const BookDetails();

        default:
          return const Scaffold(body: Center(child: Text('Route not found')));
      }
    });
  }
}
