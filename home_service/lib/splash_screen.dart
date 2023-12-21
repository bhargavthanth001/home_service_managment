import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/generated/assets.dart';
import 'package:home_service/screens.dart';
import 'package:home_service/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.introScreen);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.appIcon,
              height: 100,
              width: 100,
            ),
            height(8),
            Text(
              "Home Service",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorData.green,
                  fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
