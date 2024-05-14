import 'package:flutter/material.dart';
import 'package:hirademy_flutter_bhavesh/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).pushNamed(RouteName.bookLists);
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hirademy Books App',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('Created by Bhavesh Joshi'),
          ],
        ),
      ),
    );
  }
}
