import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:insta_app/app/models/post.dart';

class PostService {
  String baseUrl = '192.168.56.1:3000';

  Future<Map<String, dynamic>> store(user, image, caption) async {
    Map<String, String> headers = {'Content-type': 'application/json'};

    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    var spl = image.path.split('.');
    var ext = "." + spl.last;
    var response = await http.post(
      Uri.http(baseUrl, 'post'),
      headers: headers,
      body: jsonEncode(<String, dynamic>{
        "user": user.toJson(),
        "caption": caption,
        "date": DateTime.now().toString(),
        "location": "vtx",
        "image": base64Image,
        "ext": ext,
        "userLiked": [],
        "userComments": [],
        "likeds": "0",
        "comments": "0",
      }),
    );

    if (response.statusCode != 200) return null;
    return jsonDecode(response.body);
  }

  Future<List<Post>> getAllPost(username) async {
    var response = await http.get(
      Uri.http(baseUrl, 'post/postsall'),
      headers: {'username': username},
    );
    if (response.statusCode != 200) return null;

    Iterable list = jsonDecode(response.body);

    List<Post> posts = List<Post>.from(list.map((post) => Post.fromJson(post)));

    return posts;
  }
}
