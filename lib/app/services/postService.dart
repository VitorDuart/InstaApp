import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService {
  String baseUrl = '10.0.0.118:3000';

  Future<Map<String, dynamic>> store(username, image, caption) async {
    Map<String, String> headers = {'Content-type': 'application/json'};

    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    var spl = image.path.split('.');
    var ext = "." + spl.last;
    var response = await http.post(
      Uri.http(baseUrl, 'post'),
      headers: headers,
      body: jsonEncode(<String, dynamic>{
        "username": username,
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
}
