import 'package:firebase_test/LoginPage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Confirm Password"
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
            MaterialButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }, child: Text('Have an account? Click here'),)
          ],
        ),
      ),
    );
  }
}
