import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  String baseUrl = '10.0.0.118:3000';
  String endPoint = 'login';

  Future<Map<String, dynamic>> login(username, password) async {
    Map<String, String> headers = {'Content-type': 'application/json'};

    var response = await http.post(
      Uri.http(baseUrl, endPoint),
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
