import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/utils/utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controller/login_screen_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginPageController controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            height(50),
            Text(
              "Home Service",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorData.green,
              ),
            ),
            height(16),
            Text(
              "Login into the Home Service",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorData.black,
              ),
            ),
            height(16),
            GetBuilder<LoginPageController>(
              builder: (logic) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      IntlPhoneField(
                        controller: controller.mobile,
                        keyboardType: TextInputType.number,
                        cursorColor: ColorData.green,
                        initialCountryCode: 'IN',
                        onCountryChanged: (phone) =>
                            controller.onCountryChanged(phone.dialCode),
                        textAlignVertical: TextAlignVertical.center,
                        dropdownIcon: Icon(
                          Icons.arrow_drop_down,
                          color: ColorData.green,
                        ),
                        onChanged: controller.onMobileChange,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.5,
                              color: ColorData.greenShade1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.5,
                              color: ColorData.green,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                        ),
                      ),
                      height(30),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: ColorData.blackShade1,
                            ),
                          ),
                          const Text("   OR   "),
                          Expanded(
                            child: Divider(
                              color: ColorData.blackShade1,
                            ),
                          ),
                        ],
                      ),
                      height(30),
                      MaterialButton(
                        height: 50,
                        minWidth: double.infinity,
                        color: ColorData.green,
                        onPressed: controller.onTapLogin,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorData.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don\'t have an account?"),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: ColorData.green),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
