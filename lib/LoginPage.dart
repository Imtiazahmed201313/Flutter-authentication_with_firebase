import 'package:flutter/material.dart';
import 'package:firebase_test/SignUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email"
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {}, child: const Text('Log In')),
            MaterialButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
            }, child: const Text('don\'t have an account? Click here'),)
          ],
        ),
      ),
    );
  }
}
