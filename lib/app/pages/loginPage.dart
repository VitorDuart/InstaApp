import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insta_app/app/models/user.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();
  String userInput;
  String password;

  void login(context) {
    // Salva o estado atual do formulário.
    // Em outras palvras salva os estado dos
    // TextFormFiled
    _keyForm.currentState.save();

    //Aqui que você vai chamar um serviço
    // para acessar os usuários que estão
    // no servidor.
    // Pegue o json e modifique o modelo que está
    // com o notify.
    // Seria interessante criar um método para lidar com isso.
    // Pois exitem outras questões a serem implementas.

    Navigator.pushReplacementNamed(context, '/home');
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
                          onPressed: () => login(context),
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
