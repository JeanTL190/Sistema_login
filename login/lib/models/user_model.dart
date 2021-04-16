import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  bool isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User firebaseUser;
  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);
  void userSignUp({
    @required String email,
    @required String password,
  }) {
    isLoading = true;
    notifyListeners();
    //Cria um novo login/user com email e senha passados;
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      // Salva o user na variavel firebaseUser;
      firebaseUser = user.user;
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });
  }

  void userLogin({
    @required String email,
    @required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    //Loga no login/user com email e senha passados;
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      firebaseUser = user.user;
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });
  }

  void userSignOut() async {
    //Desconecta da conta logada.
    await _auth.signOut();
    //Reseta o valor da variavel firebaseUser;
    firebaseUser = null;
    notifyListeners();
  }
}
