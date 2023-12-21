import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data manager/firebase_data_handle.dart';
import '../screens.dart';

class NavBarController extends GetxController {
  int currentIndex = 0;

  onTapHome() {
    Get.back();
    Get.toNamed(Routes.homeScreen);
  }

  onTapMyService() {
    Get.back();
    Get.toNamed(Routes.myServiceScreen);
  }

  onTapSaved() {
    Get.back();
    Get.toNamed(Routes.savePage);
  }

  onTapHistory() {
    Get.back();
    Get.toNamed(Routes.historyScreen);
  }

  ontTapLogout() {
    Get.back();
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
