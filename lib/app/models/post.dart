import 'package:insta_app/app/models/user.dart';
import 'dart:convert';

class Post {
  String id;
  User user;
  String caption;
  String location;
  String image;
  List<dynamic> userLiked;
  List<dynamic> userComments;
  String likeds;
  String comments;

  Post({
    this.id,
    this.user,
    this.caption,
    this.image,
    this.userComments,
    this.likeds,
    this.comments,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = User.fromJson(json['user']);
    caption = json['caption'];
    image = json['image'];
    userLiked = json['userLiked'];
    userComments = json['userComments'];
    likeds = json['likeds'];
    comments = json['comments'];
  }
}
