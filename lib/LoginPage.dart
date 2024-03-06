import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Sign In')),
            MaterialButton(onPressed: () {}, child: Text('Have an account? Click here'),)
          ],
        ),
      ),
    );
  }
}
