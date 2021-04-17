import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/models/user_model.dart';

class RecPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double hpadding = 10.0, vpadding = 10.0;
    final GlobalKey<FormState> _form = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar Senha"),
        centerTitle: true,
      ),
      body: Container(
        padding:
            EdgeInsets.fromLTRB(hpadding * 5, vpadding * 10, hpadding * 5, 0.0),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (text) {
                  if (text.isEmpty) return "Digite o e-mail";
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_form.currentState.validate()) {
                    UserModel.of(context).userRecPassword(
                      email: _emailController.text,
                    );
                  }
                },
                child: Text("Enviar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
