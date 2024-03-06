import 'package:firebase_test/LoginPage.dart';

import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen{
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 2), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())));
  }
}