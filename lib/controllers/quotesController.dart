import 'dart:convert';

import 'package:http/http.dart' as http;

class QuotesDb {
  QuotesDb({
    required this.quote,
    required this.author,
  });
  String? quote;
  String? author;

  factory QuotesDb.fromJson(Map<String, dynamic> json) => QuotesDb(
        quote: json["quoteText"],
        author: json["quoteAuthor"],
      );

  Map<String, dynamic> toJson() => {
        "quoteText": quote,
        "quoteAuthor": author,
      };
}

class QuoteController {
  Future<QuotesDb> getQuotes() async {
    var response = await http
        .get(Uri.parse("http://saathi-quotes-production.up.railway.app/"));
    if (response.statusCode == 200) {
      String data = response.body;
      return QuotesDb.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
