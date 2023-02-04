import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saathi/models/user_post_model.dart';

class Post {
  Future<String> addPost(name, profileUrl, description, image) async {
    var response = await http.post(
        Uri.parse("https://malicious-place-production.up.railway.app/addPost"),
        body: json.encode({
          "name": name,
          "profileUrl": profileUrl,
          "headline": "Author",
          "tags": "",
          "description": description,
          "isVideoPost": false,
          "comments": "0",
          "video": "",
          "isOnline": true,
          "image": image,
          "likes": "0"
        }));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return data;
    } else {
      print("object");
      return response.body;
    }
  }

  Future<List<PostModel>> getData() async {
    http.Response response = await http.get(
        Uri.parse("https://malicious-place-production.up.railway.app/posts"));
    if (response.statusCode == 200) {
      String data = response.body;
      return postsFromJson(data);
    } else {
      throw Exception('Failed to load');
    }
  }
}
