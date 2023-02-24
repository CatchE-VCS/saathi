import 'package:flutter/material.dart';
import 'package:saathi/screens/auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/onboarding_model.dart';
import '../../../utils/app_color.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  List<OnBoardingModel> _onBoardingList = [
    OnBoardingModel(
        title: "Stay Connected",
        description: "Find a suitable person for yourself to talk to",
        image: "assets/image1.png"),
    OnBoardingModel(
        title: "Share your thoughts",
        description:
            "Start your mindfulness journey with our meditation program",
        image: "assets/image2.jpg"),
  ];
  final controller = PageController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      color: selectedIndex == 0 ? AppColors.pinkColors : AppColors.blueColors,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? AppColors.pinkColors
                            : AppColors.blueColors,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: _containerPaginationWidget(),
                  ),
                ),
                _indicatorWidget(),
                _buttonWidget(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _containerPaginationWidget() {
    return PageView.builder(
        controller: controller,
        itemCount: _onBoardingList.length,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(_onBoardingList[index].image),
                SizedBox(
                  height: 40,
                ),
                Text(
                  _onBoardingList[index].title,
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.primaryColors,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    _onBoardingList[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _indicatorWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SmoothPageIndicator(
        controller: controller,
        count: _onBoardingList.length,
        effect: ExpandingDotsEffect(
          spacing: 10,
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: AppColors.primaryColors,
          dotColor: Colors.grey,
        ),
      ),
    );
  }

  Widget _buttonWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColors.primaryColors,
          ),
          onPressed: () {
            if (selectedIndex == 0) {
              controller.animateToPage(1,
                  duration: Duration(seconds: 1), curve: Curves.easeIn);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }
          },
          child: Text(
            selectedIndex == 0 ? "Continue" : "Let's go",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
