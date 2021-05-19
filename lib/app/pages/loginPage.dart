import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/services/login.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();
  LoginService loginService = LoginService();
  String userInput;
  String password;

  onPressLogin(context, user) {
    _keyForm.currentState.save();

    Future<Map<String, dynamic>> response =
        loginService.login(userInput, password);
    response.then((json) {
      if (json != null) {
        user.setUser(json);
        Navigator.pushReplacementNamed(context, '/home');
      }
      print("The user or password not exist");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Instragram'),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Phone number, email or username',
                        ),
                        onSaved: (value) => userInput = value,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        onSaved: (value) => password = value,
                      ),
                      Container(
                        child: TextButton(
                          child: Text('Login'),
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
