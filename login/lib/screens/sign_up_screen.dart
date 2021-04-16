import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double hpadding = 10.0, vpadding = 10.0;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
      ),
      body: Container(
        padding:
            EdgeInsets.fromLTRB(hpadding * 2, vpadding * 2, hpadding * 2, 0.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "E-mail"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Senha"),
            ),
            ElevatedButton(
                onPressed: () {
                  userSignUp(
                      email: _emailController.text,
                      password: _passController.text);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Home_Screen()));
                },
                child: Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}
