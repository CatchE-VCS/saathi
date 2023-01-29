import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';


class Verify extends StatelessWidget {
  Verify({Key? key}) : super(key: key);
  final TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70,),
                Image.asset('assets/verify_image2.png'),
                const SizedBox(height: 35,),
                const Text("Verification Code sent! ",
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5,),
                const Text("Please enter the code to continue",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 25,),
                Pinput(
                  length: 5,
                  controller: otp,

                ),
                const SizedBox(height: 9,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Having Trouble? ", ),
                    InkWell(
                        child: Text("Send Again", style: TextStyle(color: Colors.blue),),
                      onTap: () => resend(),
                    )
                  ],
                ),
                const SizedBox(height: 175,),
                const Text("By signing up you agree with our Terms and Conditions and Privacy Policy ",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  resend() {}
}