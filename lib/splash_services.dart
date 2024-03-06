import 'dart:js';
import 'package:firebase_test/LoginPage.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:html';

class SplashScreen{
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 2), () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }
}