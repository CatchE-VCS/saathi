import 'package:flutter/material.dart';
import 'package:saathi/screens/auth/login_screen.dart';
import 'package:saathi/screens/auth/signup_screen.dart';
import 'package:saathi/screens/home/home_screen.dart';
import 'package:saathi/screens/splash_screens/components/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
