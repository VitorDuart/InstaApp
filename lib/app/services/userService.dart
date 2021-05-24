import 'package:insta_app/app/helps/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class UserService {
  Future<Map<String, dynamic>> store(user) async {
    String numberUser = Random().nextInt(100).toString();
    Map<String, String> headers = {'Content-type': 'application/json'};

    var response = await http.post(
      Uri.http(Network.api, 'user'),
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

  Future<Map<String, dynamic>> updateNameUsername(
      user, name, username, image) async {
    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    var spl = image.path.split('.');
    var ext = "." + spl.last;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'username': user.username,
    };

    var response = await http.put(
      Uri.http(Network.api, 'user'),
      headers: headers,
      body: jsonEncode(<String, String>{
        'name': name,
        'username': username,
        'image': base64Image,
        "ext": ext,
      }),
    );

    if (response.statusCode != 200) return null;
    return jsonDecode(response.body);
  }
}
