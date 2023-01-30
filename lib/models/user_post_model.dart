
class UserPostModel{
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

  UserPostModel({required this.profileUrl, required this.name, required this.headline, required this.isVideoPost, required this.description, required this.video, required this.image, required this.comments, required this.likes, required this.tags, required this.isOnline});
}