import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomAppBar extends StatelessWidget {
  final SizingInformation sizingInformation;

  const CustomAppBar({super.key, required this.sizingInformation}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: sizingInformation.screenSize.height * 0.08,
      padding: EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 33,
                  width: 33,
                  child: Center(
                      child: Text(
                    "c",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: sizingInformation.screenSize.width / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white70),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Container(
              height: 30,
              width: 30,
              child: Icon(FontAwesomeIcons.facebookMessenger)),
        ],
      ),
    );
  }
}
