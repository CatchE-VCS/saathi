import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          SizedBox(
            height: 290,
          ),
          Center(
            child: Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 5),
              child: Text("E-mail address")),
          SizedBox(
            height: 3,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              // labelStyle:
              //     TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              suffixIcon: Icon(
                Icons.email_outlined,
                size: 20,
                color: Colors.indigo,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 5),
              child: Text("Password")),
          SizedBox(
            height: 3,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              // labelStyle: TextStyle(
              //     fontFamily: GoogleFonts.poppins().fontFamily
              // ),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              suffixIcon: Icon(
                Icons.lock_outlined,
                size: 20,
                color: Colors.indigo,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "   Forgot Password ?",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}
