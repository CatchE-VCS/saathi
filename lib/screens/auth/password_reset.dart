import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'login_screen.dart';

class PasswordReset extends StatelessWidget {
  PasswordReset({Key? key}) : super(key: key);
  final TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset('assets/verify_image2.png'),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Password recovery",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "We will send a password recovery\ncode to your email address",
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Pinput(
                length: 5,
                controller: otp,
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Having Trouble? ",
                  ),
                  InkWell(
                    child: const Text(
                      "Send Again",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => resend(),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())),
              ),
              const SizedBox(
                height: 160,
              ),
              const Text(
                "By signing up you agree with our Terms and Conditions and Privacy Policy ",
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  resend() {}
}
