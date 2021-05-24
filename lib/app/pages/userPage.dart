import 'package:flutter/material.dart';
import 'package:insta_app/app/services/postService.dart';
import 'package:insta_app/app/services/userService.dart';
import 'package:insta_app/app/models/post.dart';
import 'package:provider/provider.dart';
import 'package:insta_app/app/models/user.dart';

class UserPage extends StatefulWidget {
  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  UserService userService = UserService();
  PostService postService = PostService();
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget postBuilder(context, idx) {
    return Image.network(posts[idx].image);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (ctx, user, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            user.username,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/home/selectimage'),
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 18, bottom: 18),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: user.profilePhoto == ''
                            ? null
                            : Image.network(user.profilePhoto).image,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1),
                    child: Column(
                      children: <Widget>[
                        Text(user.posts == null ? '0' : user.posts),
                        Text('Posts')
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: <Widget>[
                        Text(user.followers),
                        Text('Followers')
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: <Widget>[
                        Text(user.following),
                        Text('Following')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 17, bottom: 15),
              child: Text(user.name),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.98,
              height: 35,
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/user/edit'),
                child: Text(' Edit Profile'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20),
              height: 70,
              child: Center(child: Text('Highlight in soon')),
            ),
            TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.person_pin_outlined),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            FutureBuilder<List<Post>>(
                future: postService.get(user.username),
                builder: (context, snapshot) {
                  posts = snapshot.data;
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
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1,
                                ),
                                itemCount: posts.length == 0 ? 0 : posts.length,
                                itemBuilder: postBuilder,
                              ),
                              Container(
                                child: Center(child: Text('Tag People')),
                              ),
                            ],
                          ),
                        );
                      }
                  }
                }),
          ],
        ),
      );
    });
  }
}
