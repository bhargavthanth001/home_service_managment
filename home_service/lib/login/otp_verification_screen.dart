import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/controller/otp_screen_controller.dart';
import 'package:home_service/generated/assets.dart';
import 'package:home_service/utils/utils.dart';
import 'package:pinput/pinput.dart';

import '../model/user_model.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({super.key});

  final OtpScreenController controller = Get.put(OtpScreenController());

  static String verify = '';

  final UserModel? user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.startCountdown();
    });
    return Scaffold(
      backgroundColor: ColorData.white,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15),
          child: GetBuilder<OtpScreenController>(
            builder: (logic) {
              return Column(
                children: [
                  Text(
                    "Home Service",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: ColorData.green),
                  ),
                  Image.asset(Assets.verify),
                  Pinput(
                    length: 6,
                    showCursor: true,
                    onChanged: (value) => controller.onTextChanged(value),
                  ),
                  height(25),
                  Text(
                    "${controller.countdown.value} : 00",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  height(25),
                  MaterialButton(
                    height: Get.height / 20,
                    minWidth: double.infinity,
                    color: ColorData.green,
                    onPressed: () {
                      debugPrint(user.toString());
                      controller.onTapVerify(
                        OtpVerificationPage.verify,
                        controller.code,
                        user!,
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          fontSize: 15,
                          color: ColorData.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
