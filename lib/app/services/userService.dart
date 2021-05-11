import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/models/post.dart';

class UserService {
  UserService(this.user);

  User user;

  List<Post> posts() {
    return <Post>[];
  }

  List<User> followers() {
    return [];
  }

  List<User> following() {
    return [];
  }
}
