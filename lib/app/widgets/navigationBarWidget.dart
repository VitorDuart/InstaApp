import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  final navCallback;

  NavigationBar({this.navCallback});

  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  int index = 0;
  final icons = [
    Icon(Icons.home_filled),
    Icon(Icons.search),
    Icon(Icons.play_arrow_outlined),
    Icon(Icons.shopping_bag_outlined),
    Icon(Icons.person),
  ];
  final labels = [
    'Home',
    'Search',
    'IGTV',
    'Shopping',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      onTap: (index) {
        setState(() {
          widget.navCallback(index);
          this.index = index;
        });
      },
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          label: labels[index],
          icon: icons[index],
        ),
      ),
    );
  }
}
