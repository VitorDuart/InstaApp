import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String id;
  String name;
  String username;
  String profilePhoto;
  String followersUrl;
  String followingUrl;
  String postsUrl;
  String followers;
  String following;
  String posts;

  User({
    this.id,
    this.name,
    this.username,
    this.profilePhoto,
    this.followersUrl,
    this.followingUrl,
    this.postsUrl,
    this.followers,
    this.following,
    this.posts,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    profilePhoto = json['profilePhoto'];
    followersUrl = json['followers'];
    followingUrl = json['following'];
    postsUrl = json['postsUrl'];
    followers = json['followers'];
    following = json['following'];
    posts = json['posts'];
  }

  void setUser(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    profilePhoto = json['profilePhoto'];
    followersUrl = json['followers'];
    followingUrl = json['following'];
    postsUrl = json['postsUrl'];
    followers = json['followers'];
    following = json['following'];
    posts = json['posts'];

    notifyListeners();
  }
}