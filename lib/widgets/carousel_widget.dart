import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final String startText;
  const Carousel(this.startText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            startText,
            style: const TextStyle(
                fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 13,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 13,
              ),
              ElevatedButton(
                onPressed: null,
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 13,
              ),
            ],
          )
        ],
      ),
    );
  }
}
