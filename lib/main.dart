import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/MainPage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB5slwseFXNhu5xnAbSP_7qOaKDVlItTTs",
          appId: "1:985318201218:android:c6904231d4c32e2d4f219b",
          messagingSenderId: "985318201218",
          projectId: "test-firebase-ca0e8"));

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
