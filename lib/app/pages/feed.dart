import 'package:flutter/material.dart';
import 'package:insta_app/app/models/post.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/services/postService.dart';
import 'package:insta_app/app/widgets/postWidget.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  PostService postService = PostService();
  void chat() {}

  List<PostWidget> getPost(List<Post> posts) {
    return List<PostWidget>.from(
      posts.map(
        (post) => PostWidget(post: post),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Instagram',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Billabong', fontSize: 30),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/home/selectimage'),
                child: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              TextButton(
                onPressed: () {},
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
              FutureBuilder(
                  future: postService.getAllPost(user.username),
                  builder: (context, snapshot) {
                    print('dfdfsdf');
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Expanded(
                            child: Center(child: CircularProgressIndicator()));
                      default:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Erro ao carregar..."),
                          );
                        } else {
                          return Expanded(
                              child: ListView(
                            children: getPost(snapshot.data),
                          ));
                        }
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
