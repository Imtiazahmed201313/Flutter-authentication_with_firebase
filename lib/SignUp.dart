import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/HomePage.dart';
import 'package:firebase_test/LoginPage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailEditing = TextEditingController();
  final passwordEditing = TextEditingController();
  final confirmPasswordEditing = TextEditingController();
  final firstNameEditing = TextEditingController();
  final lastNameEditing = TextEditingController();
  final ageEditing = TextEditingController();

  Future<void> createAccount() async {
    String email = emailEditing.text.trim();
    String password = passwordEditing.text.trim();
    String confirmPassword = confirmPasswordEditing.text.trim();

    if (email == "" || password == "" || confirmPassword == "") {
      log("Please fill all the details!");
    } else if (password != confirmPassword) {
      log("Password does not match");
    } else {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      log("user created successfully");
    }
  }

  // @override
  // void initState() {
  //   emailEditing.dispose();
  //   passwordEditing.dispose();
  //   firstNameEditing.dispose();
  //   lastNameEditing.dispose();
  //   ageEditing.dispose();
  //   super.initState();
  // }

  void _navigate() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<void> SignUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailEditing.text.trim(),
        password: passwordEditing.text.trim());

    addUserDetails(firstNameEditing.text.trim(), lastNameEditing.text.trim(),
        emailEditing.text.trim(), int.parse(ageEditing.text.trim()));


    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future addUserDetails(String firstName, String lastName, String email,
      int age) async {
    CollectionReference collecref = await FirebaseFirestore.instance.collection(
        'users');
    collecref.add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Hello!',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Welcome Guest!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                // First name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: firstNameEditing,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'First Name'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //Last name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: lastNameEditing,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Last Name'),
                      ),
                    ),
                  ),

                  // Age
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: ageEditing,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Age'),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Email field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: emailEditing,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: passwordEditing,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: confirmPasswordEditing,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Sign in button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: SignUp,
                    child: Container(
                      height: 70,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: _navigate,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Login here',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
