import 'package:flutter/material.dart';
import 'package:insta_app/app/pages/buildingApp.dart';
import 'package:insta_app/app/pages/userPage.dart';
import 'package:insta_app/app/widgets/navigationBarWidget.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int pageIndex = 0;
  final pages = [
    BuildWidget(),
    BuildWidget(),
    BuildWidget(),
    BuildWidget(),
    UserPage(),
  ];

  void navCallback(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[pageIndex],
      bottomNavigationBar: NavigationBar(navCallback: navCallback),
    );
  }
}
