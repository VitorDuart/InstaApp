import 'package:flutter/material.dart';
import 'package:insta_app/app/pages/home.dart';
import 'package:insta_app/app/pages/loginPage.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/home': (context) => Home(),
          '/signup': (context) => SignUp(),
        },
      ),
    );
  }
}
