import 'package:get/get.dart';

class MyController extends GetxController {
  var input = ''.obs;

  getInput(var myInput) {
    input.value = myInput;
  }
}
