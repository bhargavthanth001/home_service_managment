import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/model/user_model.dart';
import 'package:home_service/screens.dart';

class OtpScreenController extends GetxController {
  final otp = TextEditingController();
  var code = "";
  RxInt countdown = 60.obs;
  Timer? _timer;

  // Function to start the countdown
  void startCountdown() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the previous timer if it's active
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
        update();
      } else {
        timer.cancel();
      }
    });
  }

  onTapVerify(
      String verificationId, String smsCode, UserModel userModel) async {
    DataHandler.onVerify(verificationId, smsCode, userModel);
    update();
    Get.toNamed(Routes.homeScreen);
  }

  onTextChanged(String value) {
    code = value;
    update();
  }
}
