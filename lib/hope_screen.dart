import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:saathi/controllers/quotesController.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

String quote = "";

class _QuotesState extends State<Quotes> {
  late String? quote;
  late String? author;
  getQuotes() async {
    var quotes = await QuoteController().getQuotes();

    author = quotes.author;
    quote = quotes.quote;
    setState(() {});
  }

  @override
  void initState() async {
    await getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(30),
          color: Color(0xffd1add6),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(quote!),
                Text(author!),
                GestureDetector(
                  onTap: () async => await getQuotes(),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.indigo,
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: Colors.white,
                            fontSize: 23),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
