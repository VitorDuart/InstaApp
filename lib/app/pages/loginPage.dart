import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/services/login.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:insta_app/app/helps/network.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();
  LoginService loginService = LoginService();
  Socket socket;

  String userInput;
  String password;

  onPressLogin(context, user) {
    _keyForm.currentState.save();

    Future<Map<String, dynamic>> response =
        loginService.login(userInput, password);
    response.then((json) {
      if (json != null) {
        user.setUser(json);
        socket = io(
          Network.socket,
          OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
              .setQuery({'user': user.username}) // optional
              .build(),
        );
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Instragram',
                  style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
                ),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.025,
                            top: MediaQuery.of(context).size.height * 0.04),
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            hintText: 'Phone number, email or username',
                          ),
                          onSaved: (value) => userInput = value,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
                          onSaved: (value) => password = value,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.025,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue)),
                          child: Text('Login',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () => onPressLogin(context, user),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Forgot your login details?'),
                    TextButton(
                      onPressed: () {},
                      child: Text('Get help logging in.'),
                    )
                  ],
                ),
                Container(
                  child: Text('OR'),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Log in with Facebook'),
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text("Don't have an account? Sign up."),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/signup/email-phone'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
