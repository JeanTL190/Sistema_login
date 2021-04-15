import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double hpadding = 10.0, vpadding = 10.0;
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
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Senha"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}
