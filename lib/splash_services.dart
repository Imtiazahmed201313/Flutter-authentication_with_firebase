import 'package:firebase_test/LoggedIn!.dart';
import 'package:firebase_test/LoginPage.dart';
import 'package:firebase_test/SignUp.dart';

import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen{
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoggedInOrNot())));
  }
}