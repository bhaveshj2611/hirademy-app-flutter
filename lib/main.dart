import 'package:flutter/material.dart';
import 'package:hirademy_flutter_bhavesh/controller/api_controller.dart';
import 'package:hirademy_flutter_bhavesh/routes/custom_route.dart';
import 'package:hirademy_flutter_bhavesh/routes/route_name.dart';
import 'package:hirademy_flutter_bhavesh/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ApiController(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      initialRoute: RouteName.splash,
      onGenerateRoute: CustomRoute.allRoutes,
    );
  }
}
