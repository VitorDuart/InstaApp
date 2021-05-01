import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InstaApp',
      home: Center(
        child: Text('Building App ...'),
      ),
      //home: DrawPoint(),
    );
  }
}
