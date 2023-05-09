import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saathi/firebase_options.dart';
import 'package:saathi/screens/auth/login_screen.dart';
import 'package:saathi/screens/auth/signup_screen.dart';
import 'package:saathi/screens/home/home_screen.dart';
import 'package:saathi/screens/splash/splash_screen.dart';
import 'package:saathi/utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  usePathUrlStrategy();
  firebaseAuth.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(const MyApp());
    } else {
      runApp(const MyHomeApp());
    }
  });
  // runApp(const MyApp());
}

bool counter = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.aBeeZee().fontFamily),
      debugShowCheckedModeBanner: false,
      home: counter ? MyHomePage() : SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
          seconds: 2,
        ),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: Image.asset("assets/logo_1.png"));
  }
}
