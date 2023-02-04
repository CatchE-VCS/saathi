import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saathi/models/user_post_model.dart';

class Post {
  Future<String> addPost(name, profileUrl, headline, tags, description,
      isVideoPost, comments, video, isOnline, image, likes) async {
    var response = await http.post(
        Uri.parse("http://malicious-place-production.up.railway.app/addPost"),
        body: json.encode({
          "name": name,
          "profileUrl": profileUrl,
          "headline": headline,
          "tags": tags,
          "description": description,
          "isVideoPost": isVideoPost,
          "comments": comments,
          "video": video,
          "isOnline": isOnline,
          "image": image,
          "likes": likes
        }));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
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
