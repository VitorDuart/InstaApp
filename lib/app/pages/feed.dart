import 'package:flutter/material.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  void newPost() {}

  void chat() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, widget) {
        print(user.name);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Instagram',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                onPressed: newPost,
                child: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              TextButton(
                onPressed: newPost,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              TextButton(
                onPressed: chat,
                child: Icon(
                  Icons.send_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.amber,
                child: Center(child: Text('Em breve stories')),
              ),
              //Expanded(child: ListView()),
              //Image.network('http://10.0.0.118:3000/images/profile.jpg'),
            ],
          ),
        );
      },
    );
  }
}
