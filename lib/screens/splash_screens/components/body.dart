import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saathi/utils/colors.dart';
// import 'package:saathi/controllers/auth_controller.dart';

// import 'package:saathi/screens/sign_in/sign_in.dart';
// import 'package:saathi/screens/sign_up/sign_up1.dart';
import 'package:saathi/utils/size_config.dart';

// This is the best practice
import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  // final AuthController _authController = AuthController();
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Connect with people and share your experience.",
      "image": "assets/image1.jpg"
    },
    {
      "text": "Explore a world full of positivity.",
      "image": "assets/image2.jpg"
    },
    {
      "text": "Find the best suggestions from people.",
      "image": "assets/image3.jpg"
    },
  ];
  // signInWithGoogle() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await _authController.signinWithGoogle();
  //   if (res != 'success') {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     if (!mounted) return;
  //     return showSnackBarr('Could not log you in!!\n Try again .....', context);
  //   } else {
  //     if (!mounted) return;
  //     showSnackBarr(
  //         'Congratulations you have been successfully signed in..', context);
  //     return Navigator.of(context).pushReplacementNamed('/home');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Image.asset(
                "assets/logo_1.png",
                width: 230,
                height: 150,
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image']!,
                  text: splashData[index]['text']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 1),
                  ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 30 : 20,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.grey[800] : Colors.white,

        border: Border.all(
          color: currentPage == index ? Colors.grey[800]! : Colors.black,
        ),
        borderRadius: BorderRadius.circular(10), //Border.all
      ),
    );
  }
}
