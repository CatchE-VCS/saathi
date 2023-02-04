import 'dart:convert';

class UserPostModel {
  final String profileUrl;
  final String name;
  final String headline;
  final bool isVideoPost;
  final String description;
  final String video;
  final String image;
  final String comments;
  final String likes;
  final String tags;
  final bool isOnline;

  UserPostModel(
      {required this.profileUrl,
      required this.name,
      required this.headline,
      required this.isVideoPost,
      required this.description,
      required this.video,
      required this.image,
      required this.comments,
      required this.likes,
      required this.tags,
      required this.isOnline});
}
List<PostModel> postsFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

// String welcomeToJson(List<PostModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  final String? profileUrl;
  final String? name;
  final String? headline;
  final bool? isVideoPost;
  final String? description;
  final String? video;
  final String? image;
  final String? comments;
  final String? likes;
  final String? tags;
  final bool? isOnline;
  DateTime postAdded;

  PostModel({
    required this.profileUrl,
    required this.name,
    required this.headline,
    required this.isVideoPost,
    required this.description,
    required this.video,
    required this.image,
    required this.comments,
    required this.likes,
    required this.tags,
    required this.isOnline,
    required this.postAdded,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        profileUrl: json["profileUrl"],
        name: json["name"],
        headline: json["headline"],
        isVideoPost: json["isVideoPost"],
        description: json["description"],
        video: json["video"],
        image: json["image"],
        comments: json["comments"],
        likes: json["likes"],
        tags: json["tags"],
        isOnline: json["isOnline"],
        postAdded: DateTime.parse(json["post_added"]),
      );
}
