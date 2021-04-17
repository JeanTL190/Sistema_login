import 'package:flutter/material.dart';
import 'package:login/models/user_model.dart';
import 'package:login/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _form = GlobalKey<FormState>();
    final double hpadding = 10.0, vpadding = 10.0;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Container(
            padding: EdgeInsets.fromLTRB(
                hpadding * 2, vpadding * 2, hpadding * 2, 0.0),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "E-mail"),
                    controller: _emailController,
                    validator: (text) {
                      if (text.isEmpty) {
                        return "Digite o e-mail";
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Senha"),
                    controller: _passController,
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty) {
                        return "Digite a senha";
                      }
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_form.currentState.validate()) {
                          model.userSignUp(
                            email: _emailController.text,
                            password: _passController.text,
                            onSucess: _onLoginSuccess,
                            onFail: _onLoginFail,
                          );
                        }
                      },
                      child: Text("Cadastrar"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //Função caso o login seja bem-sucedido
  void _onLoginSuccess() {
    //Mudança de tela
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    //CODE
  }

  //Função caso o login falhe
  void _onLoginFail() {
    //CODE
  }
}
