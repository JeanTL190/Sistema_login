import 'package:flutter/material.dart';
import 'package:login/models/user_model.dart';
import 'package:login/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Logado !"),
              ElevatedButton(
                onPressed: () {
                  model.userSignOut();
                  Navigator.of(context).pop();
                },
                child: Text("Sair"),
                style: ButtonStyle(),
              ),
            ],
          );
        }
      },
    );
  }
}
