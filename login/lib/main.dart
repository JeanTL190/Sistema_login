import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/models/user_model.dart';
import 'package:login/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

Future<void> main() async {
  //Inicialização do firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: LoginScreen(),
    );
  }
}
