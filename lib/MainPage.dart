import 'package:firebase_test/splash_services.dart';
import 'package:flutter/material.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  SplashScreen splashScreen = SplashScreen();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),),
      ),
    );
  }
}
