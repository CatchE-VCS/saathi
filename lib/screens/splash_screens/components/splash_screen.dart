import 'package:flutter/material.dart';
import 'package:saathi/screens/splash_screens/components/body.dart';
import 'package:saathi/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
//