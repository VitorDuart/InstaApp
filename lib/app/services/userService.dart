import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class UserService {
  String baseUrl = '10.0.0.118:3000';

  List<Post> posts() {
    return <Post>[];
  }

  List<User> followers() {
    return [];
  }

  List<User> following() {
    return [];
  }

  Future<Map<String, dynamic>> store(user) async {
    String numberUser = Random().nextInt(100).toString();
    Map<String, String> headers = {'Content-type': 'application/json'};

    var response = await http.post(
      Uri.http(baseUrl, 'user'),
      headers: headers,
      body: jsonEncode(<String, String>{
        'name': user.name,
        'username':
            '${user.name.replaceAll(' ', '').toLowerCase()}${numberUser}',
        'password': user.password,
        'email': user.email,
        'birthday': user.birthday,
        'profilePhoto': '',
        'followersUrl': '',
        'followingUrl': '',
        'postsUrl': '',
        'followers': '0',
        'following': '0',
        'posts': '0',
      }),
    );

    if (response.statusCode != 200) return null;
    return jsonDecode(response.body);
  }
}
