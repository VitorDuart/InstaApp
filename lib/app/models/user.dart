import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String id;
  String name;
  String username;
  String password;
  String email;
  String birthday;
  String profilePhoto;
  List<dynamic> followersList;
  List<dynamic> followingList;
  String followers;
  String following;
  String posts;

  User({
    this.id,
    this.name,
    this.username,
    this.profilePhoto,
    this.followersList,
    this.followingList,
    this.followers,
    this.following,
    this.posts,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    profilePhoto = json['profilePhoto'];
    followersList = json['followersList'];
    followingList = json['followingList'];
    followers = json['followers'];
    following = json['following'];
    posts = json['posts'];
  }

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "name": this.name,
        "username": this.username,
        "profilePhoto": this.profilePhoto,
        "followersList": this.followersList,
        "followingList": this.followingList,
        "followers": this.followers,
        "following": this.following,
        "posts": this.posts,
      };

  void setUser(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    profilePhoto = json['profilePhoto'];
    followersList = json['followersList'];
    followingList = json['followingList'];
    followers = json['followers'];
    following = json['following'];
    posts = json['posts'];

    notifyListeners();
  }

  void setId(id) {
    this.id = id;
    notifyListeners();
  }

  void setName(name) {
    this.name = name;
    notifyListeners();
  }

  void setUsername(username) {
    this.username = username;
    notifyListeners();
  }

  void setEmail(email) {
    this.email = email;
    notifyListeners();
  }

  void setBirthday(birthday) {
    this.birthday = birthday;
    notifyListeners();
  }

  void setPassword(password) {
    this.password = password;
    notifyListeners();
  }
}
