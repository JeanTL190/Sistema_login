import 'package:flutter/material.dart';

//Tela de Login padrão com informações para o Usuário colocar E-mail e Senha
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h_padding = 10.0, v_padding = 10.0;
    return Container(
      padding: EdgeInsets.fromLTRB(
          h_padding * 5, v_padding * 10, h_padding * 5, 0.0),
      child: Form(
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
                onFieldSubmitted: (text) {},
              ),
              SizedBox(
                height: v_padding * 2,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Senha"),
                obscureText: true,
                onFieldSubmitted: (text) {},
              ),
              //Botões "Esqueci a senha" e "criar conta"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
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
                onPressed: () {},
                child: Text("Entrar"),
                style: ButtonStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
