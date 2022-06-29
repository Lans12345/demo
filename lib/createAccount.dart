import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/signIn.dart';

class CreateAccount extends StatelessWidget {
  late String email = '';
  late String password = '';

  Future createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      print('done');
    } catch (e) {
      Get.snackbar('Error', 'Cannot Procceed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Creating Account'),
      Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: TextFormField(
          onChanged: (_input) {
            email = _input;
          },
          decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.grey,
                fontSize: 12.0,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: TextFormField(
          onChanged: (_input) {
            password = _input;
          },
          decoration: const InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.grey,
                fontSize: 12.0,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      RaisedButton(
        onPressed: () async {
          createAccount();
          Get.to(SignIn());
        },
        child: const Text('Create Account'),
      )
    ]));
  }
}
