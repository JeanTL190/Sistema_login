import 'package:flutter/material.dart';
import 'package:login/models/user_model.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/rec_pass_screen.dart';
import 'package:login/screens/sign_up_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double hpadding = 10.0, vpadding = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Container(
            padding: EdgeInsets.fromLTRB(
                hpadding * 5, vpadding * 10, hpadding * 5, 0.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people,
                      size: 120.0,
                    ),
                    SizedBox(
                      height: vpadding * 2,
                    ),
                    //Campos de E-mail e Senha
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text.isEmpty)
                          return "Digite seu e-mail";
                        else
                          return null;
                      },
                    ),
                    SizedBox(
                      height: vpadding * 2,
                    ),
                    TextFormField(
                      controller: _passController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Senha"),
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty)
                          return "Digite sua senha";
                        else
                          return null;
                      },
                    ),
                    //Botões "Esqueci a senha" e "criar conta"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                          },
                          child: Text("Criar conta"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RecPassScreen()));
                          },
                          child: Text("Esqueci a senha"),
                        )
                      ],
                    ),
                    //Botão de Login

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          model.userLogin(
                              email: _emailController.text,
                              password: _passController.text,
                              onSucess: _onLoginSuccess,
                              onFail: _onLoginFail);
                        }
                      },
                      child: Text("Entrar"),
                      style: ButtonStyle(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onLoginSuccess() {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  //Função caso o login falhe
  void _onLoginFail() {
    //CODE
  }
}
//Tela de Login padrão com informações para o Usuário colocar E-mail e Senha
