import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User firebaseUser;

  void cadastrar({
    @required String email,
    @required String password,
  }) {
    //Cria um novo login/user com email e senha passados;
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      // Salva o user na variavel firebaseUser;
      firebaseUser = user.user;
    });
  }

  void logar({
    @required String email,
    @required String password,
  }) async {
    //Loga no login/user com email e senha passados;
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      firebaseUser = user.user;
    });
  }

  void signOut() async {
    //Desconecta da conta logada.
    await _auth.signOut();
    //Reseta o valor da variavel firebaseUser;
    firebaseUser = null;
  }
}
