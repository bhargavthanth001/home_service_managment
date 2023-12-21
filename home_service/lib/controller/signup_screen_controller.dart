import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/model/user_model.dart';
import 'package:home_service/screens.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignupPageController extends GetxController {
  var f_name = TextEditingController();
  var l_name = TextEditingController();
  var email = TextEditingController();
  var mobile = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var countryCode = "+91";
  bool isChecked = false;

  void onTextChanged(String? text) {
    formKey.currentState?.validate();
    update();
  }

  void onMobileChange(PhoneNumber? number) {
    formKey.currentState?.validate();
    update();
  }

  void onTapCheck(bool? checked) {
    isChecked = !isChecked;
    update();
  }

  onCountryChanged(String phone) {
    countryCode = "+$phone ";
    update();
  }

  onTapCreateAccount() async {
    if (formKey.currentState?.validate() ?? false) {
      final mobileNo = countryCode + mobile.text;
      final createdAt = DateTime.now().toLocal().toString();
      DataHandler.verifyNumber(mobileNo);
      final user = UserModel(
          fName: f_name.text,
          lName: l_name.text,
          email: email.text,
          mobile: mobileNo,
          createdAt: createdAt);
      Get.toNamed(Routes.otpScreen, arguments: user);
    }
  }

  onTapCreateAccountFalse() {
    if (formKey.currentState?.validate() ?? false) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: ColorData.red,
          title: "Home Service",
          message: 'Accept the terms and condition',
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  onTapLogin() {
    Get.toNamed(
      Routes.loginScreen,
    );
  }
}
