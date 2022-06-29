import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx/page.dart';
import 'package:getx/controller.dart';

import 'package:get/get.dart';
import 'package:getx/signIn.dart';

class FirstPage extends StatelessWidget {
  final myController = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SecondPage();
            } else {
              return SignIn();
            }
          }),
    );
  }
}
