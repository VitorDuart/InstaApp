import 'package:flutter/material.dart';
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
  UserService userService;
  List<Post> posts;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    userService = UserService();
    posts = userService.posts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void editProfile() {}

  Container postBuilder(context, idx) {
    Post post = posts[idx];
    return Container(
      child: Image.network(post.assetsUrl[0]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (ctx, user, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            user.username,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 18, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: <Widget>[
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: user.profilePhoto == null
                          ? null
                          : Image.network(user.profilePhoto),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(user.name),
                    ),
                  ]),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
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
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              child: TextButton(
                onPressed: editProfile,
                child: Text(' Edit Profile'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 20),
              height: 70,
              color: Colors.amber,
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
            Expanded(
              child: TabBarView(
                children: [
                  posts.length == 0
                      ? Container(child: Center(child: Text('Nothing Posts')))
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: posts.length,
                          itemBuilder: postBuilder,
                        ),
                  Container(child: Center(child: Text('Tag People'))),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      );
    });
  }
}
