import 'dart:convert';
import 'package:http/http.dart' as http;

class QuotesDb {
  String? quote;
  String? author;

  QuotesDb({required this.quote, required this.author});

  factory QuotesDb.fromMap(Map<String, dynamic> json) => QuotesDb(
        quote: json["quoteText"],
        author: json["quoteAuthor"],
      );

  Map<String, dynamic> toMap() => {
        "quoteText": quote,
        "quoteAuthor": author,
      };
}

class QuoteController {
  Future<QuotesDb> getQuotes() async {
    var response = await http
        .get(Uri.parse("https://overjoyed-sound-production.up.railway.app/"));
    if (response.statusCode == 200) {
      String data = response.body;
      return QuotesDb.fromMap(jsonDecode(response.body));
    } else {
      return QuotesDb(quote: null, author: null);
    }
  }
}
