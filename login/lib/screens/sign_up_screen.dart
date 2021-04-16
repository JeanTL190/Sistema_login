import 'package:flutter/material.dart';
import 'package:login/login.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Login login = Login();
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
                  login.cadastrar(
                      email: _emailController.text,
                      password: _passController.text);
                },
                child: Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}
