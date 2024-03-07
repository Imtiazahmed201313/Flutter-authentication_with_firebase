import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/HomePage.dart';
import 'package:firebase_test/LoginPage.dart';

class LoggedInOrNot extends StatefulWidget {
  const LoggedInOrNot({super.key});

  @override
  State<LoggedInOrNot> createState() => _LoggedInOrNotState();
}

class _LoggedInOrNotState extends State<LoggedInOrNot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return HomePage();
          }
          else{
            return LoginScreen();
          }
        },
      ),
    );
  }
}
