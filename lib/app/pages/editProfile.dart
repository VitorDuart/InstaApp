import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/services/userService.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final _keyForm = GlobalKey<FormState>();
  String name;
  String username;
  UserService userService = UserService();
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

  onPressedDone(context, user) {
    _keyForm.currentState.save();
    Future<Map<String, dynamic>> response =
        userService.updateNameUsername(user, name, username, _image);
    response.then((value) {
      if (value != null) {
        user.setNameUsernamePhoto(name, username, value['profilePhoto']);
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, child) {
      name = user.name;
      username = user.username;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Edit Profile'),
          actions: [
            TextButton(
              child: Icon(Icons.done),
              onPressed: () => onPressedDone(context, user),
            ),
          ],
        ),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _image == null
                          ? (user.profilePhoto == ''
                              ? Image.asset('assets/images/perfil.jpg').image
                              : Image.network(user.profilePhoto).image)
                          : Image.file(_image).image),
                ),
              ),
            ),
            Container(
              child: TextButton(
                child: Text('Change Profile Photo'),
                onPressed: getImage,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.93,
              child: Form(
                key: _keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    TextFormField(
                      initialValue: name,
                      onSaved: (value) => name = value,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Username')),
                    TextFormField(
                      initialValue: username,
                      onSaved: (value) => username = value,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}


// _image == null
//                           ? (user.profilePhoto == ''
//                               ? null
//                               : Image.network(user.profilePhoto))
//                           : Image.file(_image, fit: BoxFit.scaleDown),