import 'package:colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/screens.dart';

class ProfilePageController extends GetxController {
  ontTapLogout() {
    logOutDialog();
  }

  void logOutDialog() {
    Get.defaultDialog(
        title: "Are you sure \nyou want to logout ?",
        content: const Text("Your account will be logout from this device !"),
        contentPadding: const EdgeInsets.all(10),
        onConfirm: onConfirm,
        buttonColor: ColorData.green,
        confirmTextColor: ColorData.white,
        cancelTextColor: ColorData.green,
        onCancel: onCancel);
  }

  onConfirm() {
    DataHandler.signOut();
    Get.offAllNamed(Routes.introScreen);
    Get.snackbar(
      "Home Service",
      "Logout Success !!! ",
      backgroundColor: ColorData.red,
      colorText: ColorData.white,
    );
  }

  onCancel() {
    Get.back();
  }
}
