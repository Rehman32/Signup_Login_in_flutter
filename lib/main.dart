import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './pages/loginPage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCaCGwoewtP6A5qJTWOHL_eN_Vieb0pSfQ",
        appId: "1:616572642205:android:4a9750ff25113b660fc574",
        messagingSenderId: "616572642205",
        projectId: "loginsignup-46420")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

