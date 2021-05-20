import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/services/postService.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class PickImage extends StatefulWidget {
  @override
  PickImageState createState() => PickImageState();
}

class PickImageState extends State<PickImage> {
  File _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            child: Icon(Icons.arrow_forward,
                color: _image == null ? Colors.black : Colors.blue),
            onPressed: () => Navigator.pushNamed(context, '/home/newpost',
                arguments: {'path': _image.path}),
          ),
        ],
      ),
      body: Center(
        child: _image == null
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/images/camera.png'),
                Text('No image selected!'),
              ])
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class NewPost extends StatefulWidget {
  @override
  NewPostState createState() => NewPostState();
}

class NewPostState extends State<NewPost> {
  final _keyForm = GlobalKey<FormState>();
  PostService postService = PostService();
  File _image;
  String caption;

  onPressedDone(context, user) {
    _keyForm.currentState.save();
    Future<Map<String, dynamic>> response =
        postService.store(user.username, _image, caption);
    response.then((value) {
      if (value != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments as Map;
    _image = File(arguments['path']);
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('New Post'),
            actions: [
              TextButton(
                child: Icon(Icons.done),
                onPressed: () => onPressedDone(context, user),
              )
            ],
          ),
          body: SizedBox(
            child: ListView(
              children: [
                Row(
                  children: [
                    Image.file(_image, width: 60, height: 60),
                    Form(
                      key: _keyForm,
                      child: Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Write a caption',
                          ),
                          onSaved: (value) => caption = value,
                        ),
                      ),
                    )
                  ],
                ),
                Divider(color: Colors.black),
                Container(
                  alignment: Alignment.centerLeft,
                  child:
                      TextButton(onPressed: () {}, child: Text('Add Location')),
                ),
                Divider(color: Colors.black),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {}, child: Text('Advanced Settings')),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
