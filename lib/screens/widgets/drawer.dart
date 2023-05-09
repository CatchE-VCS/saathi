import 'package:flutter/material.dart';
import 'package:saathi/games/games.dart';

Widget appdrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Games()));
            },
          ),
        ],
      ),
    ),
  );
}
