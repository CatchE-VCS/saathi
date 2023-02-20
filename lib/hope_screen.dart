import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saathi/controllers/quotesController.dart';
import 'package:translator/translator.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

String quote = "";

class _QuotesState extends State<Quotes> {
  GoogleTranslator translator = new GoogleTranslator();
  String out = "";
  final lang = TextEditingController();
  String quote = "";
  String author = "";
  void trans(String lang) async {
    await translator
        .translate(quote, to: lang) //translating to hi = hindi
        .then((output) {
      setState(() {
        quote = output
            .toString(); //placing the translated text to the String to be used
        trans2(lang);
      });
      print(out);
    });
  }

  void trans2(String lang) async {
    await translator
        .translate(author, to: lang) //translating to hi = hindi
        .then((output) {
      setState(() {
        author = output
            .toString(); //placing the translated text to the String to be used
      });
      print(out);
    });
  }

  getQuotes() async {
    var quotes = await QuoteController().getQuotes();

    author = quotes.author!;
    quote = quotes.quote!;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              trans("en");
                              setState(() {
                                quote = out;
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff101010)),
                              child: Center(
                                child: Text(
                                  "ENGLISH",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xffb9b8b8)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              trans("hi");
                              setState(() {
                                quote = out;
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff101010)),
                              child: Center(
                                  child: Text(
                                "HINDI",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffb9b8b8)),
                              )),
                            ),
                          )
                        ],
                      ),
                      Text(
                        quote ??= "",
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff101010))),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        author ??= "",
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff101010))),
                      ),
                    ],
                  ),
                  //SizedBox(height: 30,),
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
