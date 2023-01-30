import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
          ),
          Text(
            'Welcome Back!',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: emailController,
          )
        ],
      ),
    );
  }
}
