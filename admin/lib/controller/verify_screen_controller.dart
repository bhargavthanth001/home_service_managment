import 'package:admin/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyScreenController extends GetxController {
  final pin = TextEditingController();
  var formKey = GlobalKey<FormState>();

  onTextChanged(String text) {
    if (formKey.currentState?.validate() ?? false) {
      Get.toNamed(Routes.homeScreen);
    } else {
      formKey.currentState?.validate();
    }
  }
}
