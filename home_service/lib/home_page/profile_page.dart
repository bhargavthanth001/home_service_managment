import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/controller/profile_page_controller.dart';
import 'package:home_service/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfilePageController controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorData.white,
        actions: [
          GetBuilder<ProfilePageController>(
            builder: (logic) {
              return ElevatedButton(
                onPressed: controller.ontTapLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorData.white,
                  elevation: 0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: ColorData.red,
                    ),
                    width(8),
                    Text(
                      "Logout",
                      style: TextStyle(color: ColorData.red),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
