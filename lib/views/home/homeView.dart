import 'package:flutter/material.dart';
import 'package:walktron/controllers/authController.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () {
          AuthController.to.logout();
        }),
      ),
    );
  }
}
