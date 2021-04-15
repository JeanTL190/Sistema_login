import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h_padding = 10.0, v_padding = 10.0;
    return Material(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            h_padding * 5, v_padding * 10, h_padding * 5, 0.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Nome"),
            ),
          ],
        ),
      ),
    );
  }
}
