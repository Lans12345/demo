import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller.dart';
import 'package:getx/page.dart';
import 'package:getx/signIn.dart';

class MyHomePage extends StatelessWidget {
  late String input = '';

  final myController = Get.find<MyController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                  onChanged: (_input) {
                    input = _input;
                  },
                  validator: (value) {
                    if (input.isEmpty) {
                      return 'ENTER INPUT';
                    } else {
                      myController.getInput(input);
                      Get.off(() => SecondPage());
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Input',
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
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                },
                child: const Text('Press'),
              ),
              const SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Get.to(SignIn());
                },
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
