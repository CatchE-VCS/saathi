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
  String? quote ;
  String? author ;
  getQuotes() async {
    var quotes = await QuoteController().getQuotes();

    author = quotes.author;
    quote = quotes.quote;
    setState(() {});
  }

  void qote() async {
    await getQuotes();
  }

  @override
  void initState() {
    qote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
              padding: EdgeInsets.all(10),
                      color: Color(0xffb9b8b8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(

                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(quote ??= "", style: GoogleFonts.robotoMono(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff101010))),),
                                  SizedBox(height: 90,),
                                  Text(author ??= "", style: GoogleFonts.robotoMono(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff101010))),),

                                ],
                              ),
                              SizedBox(height: 100,),
                              GestureDetector(
                                onTap: () async => await getQuotes(),
                                child: Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff403f3f),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.poppins().fontFamily,
                                            color: Color(0xffb9b8b8),
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                ),
    );
  }
}
