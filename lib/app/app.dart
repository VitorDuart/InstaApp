import 'package:flutter/material.dart';
import 'package:insta_app/app/pages/editProfile.dart';
import 'package:insta_app/app/pages/home.dart';
import 'package:insta_app/app/pages/loginPage.dart';
import 'package:insta_app/app/pages/newPost.dart';
import 'package:insta_app/app/pages/signup.dart';
import 'package:insta_app/app/pages/userPage.dart';
import 'package:provider/provider.dart';
import 'package:insta_app/app/models/user.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
        Provider(create: (context) => Login()),
        Provider(create: (context) => UserPage()),
        Provider(create: (context) => EmailPhone()),
        Provider(create: (context) => NamePassword()),
        Provider(create: (context) => Birthday()),
        Provider(create: (context) => EditProfile()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData(primaryColor: Colors.amber),
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/home': (context) => Home(),
          '/home/selectimage': (context) => PickImage(),
          '/home/newpost': (context) => NewPost(),
          '/signup/email-phone': (context) => EmailPhone(),
          '/signup/user': (context) => NamePassword(),
          '/signup/birthday': (context) => Birthday(),
          '/signup/done': (context) => Finish(),
          '/user/edit': (context) => EditProfile(),
        },
      ),
    );
  }
}
