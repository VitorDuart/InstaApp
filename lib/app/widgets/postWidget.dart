import 'package:flutter/cupertino.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatefulWidget {
  @override
  PostWidgetState createState() => PostWidgetState();
}

class PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Container();
      },
    );
  }
}
