import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/screens.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../model/user_model.dart';

class LoginPageController extends GetxController {
  var mobile = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var countryCode = "+91";

  void onTextChanged(String? text) {
    formKey.currentState?.validate();
    update();
  }

  void onMobileChange(PhoneNumber? number) {
    formKey.currentState?.validate();
    update();
  }

  onCountryChanged(String phone) {
    countryCode = "+$phone ";
    update();
  }

  void onTapLogin() async {
    final mobileNo = countryCode + mobile.text;
    debugPrint(mobileNo);
    final UserModel? user = await DataHandler.getSingleUser(mobileNo);
    if (user == null) {
      debugPrint(user.toString());
      Get.snackbar("Home Service", "Account not exist please register !",
          backgroundColor: ColorData.red, colorText: ColorData.white);
    } else {
      DataHandler.verifyNumber(mobileNo);
      Get.toNamed(
        Routes.otpScreen,
        arguments: user,
      );
    }
  }


}
