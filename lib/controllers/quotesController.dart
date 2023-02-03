class QuotesDb {
  String quote;
  String author;

  QuotesDb({required this.quote, required this.author});

  factory QuotesDb.fromMap(Map<String, dynamic> json) => new QuotesDb(
        quote: json["quote"],
        author: json["author"],
      );

  Map<String, dynamic> toMap() => {
        "quote": quote,
        "author": author,
      };
}
