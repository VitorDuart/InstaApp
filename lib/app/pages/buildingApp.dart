import 'package:flutter/material.dart';

class BuildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/in-development1.jpg'),
          Text(
            'Building App ...',
            style: TextStyle(inherit: false, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
