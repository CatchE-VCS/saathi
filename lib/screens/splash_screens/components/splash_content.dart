import 'package:flutter/material.dart';
import 'package:saathi/utils/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(310),
          width: getProportionateScreenWidth(555),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
