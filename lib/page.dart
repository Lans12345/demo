import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locally/locally.dart';

class SecondPage extends StatelessWidget {
  final myController = Get.find<MyController>();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myController.input.string,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Title',
                    middleText: 'Content',
                    confirm: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: const Text('cpnfirm'),
                    ),
                    cancel: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: const Text('cancel'),
                    ),
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {});
                Get.snackbar(
                  'Title',
                  myController.input.string,
                  duration: const Duration(seconds: 1, milliseconds: 100),
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Press'),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.back();
              },
              child: const Text('Log Out'),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Locally locally = Locally(
                  context: context,
                  payload: 'test',
                  pageRoute:
                      MaterialPageRoute(builder: (context) => SecondPage()),
                  appIcon: 'mipmap/ic_launcher',
                );

                locally.show(title: 'weqwe', message: 'messgae');
              },
              child: const Text('Notif'),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.currentUser
                      ?.sendEmailVerification();
                  print('done');
                } catch (e) {
                  Get.snackbar('Error', e.toString());
                  print('error');
                }
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
