import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/controller/side_nav_bar.dart';
import 'package:home_service/utils/utils.dart';

import '../data manager/firebase_data_handle.dart';

Widget drawer() {
  final NavBarController controller = Get.put(NavBarController());
  return Drawer(
    backgroundColor: ColorData.white,
    child: Column(
      children: [
        FutureBuilder(
          future: DataHandler.getCurrentUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final response = snapshot.data;
              if (response != null) {
              } else {
                return const Center(
                  child: Text("No Data Found !!!"),
                );
              }
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: ColorData.green),
                accountName: Text(
                  "${response.fName} ${response.lName}",
                  style: const TextStyle(fontSize: 20),
                ),
                accountEmail: Text(response.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: ColorData.white,
                  child: Icon(
                    Icons.person,
                    color: ColorData.green,
                    size: 50,
                  ),
                ),
              );
            } else {
              return Container(
                height: 150,
                width: double.infinity,
                color: ColorData.green,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorData.white,
                  ),
                ),
              );
            }
          },
        ),

        GestureDetector(
          onTap: () => {controller.onTapHome()},
          child: ListTile(
            leading: Icon(
              Icons.home,
              color: ColorData.green,
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {controller.onTapMyService()},
          child: ListTile(
            leading: Icon(
              Icons.miscellaneous_services,
              color: ColorData.green,
            ),
            title: const Text(
              "My Services",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        // Divider(
        //   color: ColorData.blackShade1,
        // ),
        GestureDetector(
          onTap: () => {controller.onTapSaved()},
          child: ListTile(
            leading: Icon(
              Icons.bookmark_border,
              color: ColorData.green,
            ),
            title: const Text(
              "Saved",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            controller.ontTapLogout();
          },
          child: Container(
            color: ColorData.redShade1,
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: ColorData.white,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: ColorData.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        height(10),
      ],
    ),
  );
}
