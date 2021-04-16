import 'package:flutter/material.dart';
import 'package:login/login.dart';

class Home_Screen extends StatelessWidget {
  Login login = Login();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Logado !"),
        ElevatedButton(
          onPressed: () {
            login.signOut();
          },
          child: Text("Sair"),
          style: ButtonStyle(),
        ),
      ],
    );
  }
}
