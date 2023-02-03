import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

String quote = "";

class _QuotesState extends State<Quotes> {
  @override
  Future getData() async {
    http.Response response =
        await http.get(Uri.parse("http://ec87-103-101-118-4.ngrok.io/quotes"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data));
      print(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: getData,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
