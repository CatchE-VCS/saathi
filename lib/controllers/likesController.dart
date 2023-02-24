import 'dart:convert';

import 'package:http/http.dart' as http;

class Likes {
  Likes({
    required this.uid,
    required this.likes,
  });
  String? uid;
  int? likes;

  factory Likes.fromJson(Map<String, dynamic> json) => Likes(
        uid: json["uid"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "likes": likes,
      };
}

class LikesController {
  Future<Likes> getLikes(String uid) async {
    var response = await http.get(
        Uri.parse("https://saathi-production.up.railway.app/getLikes?id=$uid"));
    if (response.statusCode == 200) {
      String data = response.body;
      return Likes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<String> addLike(String uid, String id) async {
    var response = await http.post(
        Uri.parse("https://saathi-production.up.railway.app/like"),
        body: json.encode({"id": id, "uid": uid}));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return data;
    } else {
      print("object");
      return response.body;
    }
  }
}
