import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/LoginPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> SignOut() async {
    await FirebaseAuth.instance.signOut();
    log('logout');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: SignOut,
            icon: Icon(Icons.logout),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: ((context, snapshots) {
            if (snapshots.connectionState == ConnectionState.active) {
              if (snapshots.hasData) {
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${snapshots.data?.docs[index]["first name"]}"),
                    subtitle: Text("${snapshots.data?.docs[index]["email"]}"),
                    leading: Text("${index+1}",style: TextStyle(
                      fontSize: 20
                    ),),
                    trailing: Text("${snapshots.data?.docs[index]["age"]}",style: TextStyle(
                      fontSize: 15
                    ),),
                  );
                },itemCount: snapshots.data?.docs.length,);
              } else {
                return Center(child: const Text('error'));
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
        )
    );
  }
}
