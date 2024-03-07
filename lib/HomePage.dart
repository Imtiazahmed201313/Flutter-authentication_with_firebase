import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/LoginPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> SignOut() async{
    await FirebaseAuth.instance.signOut();
    log('logout');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Homepage', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ElevatedButton(onPressed: SignOut, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
