import 'package:flutter/material.dart';
import 'package:login/screens/sign_up_screen.dart';

//Tela de Login padrão com informações para o Usuário colocar E-mail e Senha
class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double h_padding = 10.0, v_padding = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
            h_padding * 5, v_padding * 10, h_padding * 5, 0.0),
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
                  height: v_padding * 2,
                ),
                //Campos de E-mail e Senha
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty) return "Digite seu E-mail";
                  },
                ),
                SizedBox(
                  height: v_padding * 2,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Senha"),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty) return "Digite sua senha";
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
                      onPressed: () {},
                      child: Text("Esqueci a senha"),
                    )
                  ],
                ),
                //Botão de Login

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("Entrou");
                    }
                  },
                  child: Text("Entrar"),
                  style: ButtonStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
