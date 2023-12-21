import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/intro_screen_controller.dart';
import '../generated/assets.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final IntroScreenController controller = Get.put(IntroScreenController());

  final PageController pageController = PageController();

  final int currentPage = 0;
  final List<String> imageUrl = [
    Assets.images1,
    Assets.images2,
    Assets.images3,
  ];

  final List<String> content = [
    "Home Plumbing Repair & Maintenance",
    "This is the second page",
    "This is the third page"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.white,
      body: Column(
        children: [
          height(60),
          Text(
            "Home Service",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorData.green),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: imageUrl.length,
              itemBuilder: (context, index) {
                return Container(
                  height: Get.width,
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imageUrl[index],
                      ),
                      height(15),
                      Text(
                        content[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: imageUrl.length,
            effect: ExpandingDotsEffect(
              dotColor: ColorData.green,
              activeDotColor: ColorData.green,
            ),
          ),
          height(16),
          MaterialButton(
            height: Get.height / 17,
            minWidth: Get.width / 1.1,
            color: ColorData.green,
            onPressed: controller.onPressedLogin,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Log in",
              style: TextStyle(
                  color: ColorData.white, fontWeight: FontWeight.bold),
            ),
          ),
          height(16),
          SizedBox(
            width: Get.width / 1.1,
            child: TextButton(
              onPressed: controller.onPressSignup,
              child: Text(
                "Create new Account ? Sign up",
                style: TextStyle(color: ColorData.green),
              ),
            ),
          ),
          height(80),
        ],
      ),
    );
  }
}
