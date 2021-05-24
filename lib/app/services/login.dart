import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:insta_app/app/helps/network.dart';

class LoginService {
  Future<Map<String, dynamic>> login(username, password) async {
    Map<String, String> headers = {'Content-type': 'application/json'};

    var response = await http.post(
      Uri.http(Network.api, 'login'),
      headers: headers,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode != 200) return null;

    return jsonDecode(response.body);
  }
}
