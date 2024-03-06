import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/LoginPage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailEditing = TextEditingController();
  TextEditingController passwordEditing = TextEditingController();
  TextEditingController confirmPasswordEditing = TextEditingController();

  Future<void> createAccount() async{
    String email = emailEditing.text.trim();
    String password = passwordEditing.text.trim();
    String confirmPassword = confirmPasswordEditing.text.trim();

    if (email == "" || password == "" || confirmPassword == "") {
      log("Please fill all the details!");
    } else if (password != confirmPassword) {
      log("Password does not match");
    } else {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      log("user created successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: emailEditing,
                decoration: InputDecoration(hintText: "Email"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: passwordEditing,
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: confirmPasswordEditing,
                decoration: InputDecoration(hintText: "Confirm Password"),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              createAccount();
            }, child: const Text('Sign Up')),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text('Have an account? Click here'),
            )
          ],
        ),
      ),
    );
  }
}
