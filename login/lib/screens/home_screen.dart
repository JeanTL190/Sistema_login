import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/screens/login_screen.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Logado !"),
        ElevatedButton(
          onPressed: () {
            userSignOut();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text("Sair"),
          style: ButtonStyle(),
        ),
      ],
    );
  }
}
