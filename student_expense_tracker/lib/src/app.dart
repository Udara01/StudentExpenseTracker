import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'auth/welcome_screen.dart';
import 'auth/loading_screen.dart';
import 'home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoadingScreen(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),  
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

