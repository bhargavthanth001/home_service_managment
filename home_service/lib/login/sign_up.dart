import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/controller/signup_screen_controller.dart';
import 'package:home_service/utils/utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final SignupPageController controller = Get.put(SignupPageController());

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
              "Sign up Here",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorData.black,
              ),
            ),
            height(50),
            GetBuilder<SignupPageController>(
              builder: (logic) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.f_name,
                        cursorColor: ColorData.green,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          return null;
                        },
                        onChanged: controller.onTextChanged,
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
                          hintText: "Enter the first name",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                        ),
                      ),
                      height(12),
                      TextFormField(
                        controller: controller.l_name,
                        cursorColor: ColorData.green,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          return null;
                        },
                        onChanged: controller.onTextChanged,
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
                          hintText: "Enter the last name",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                        ),
                      ),
                      height(12),
                      TextFormField(
                        controller: controller.email,
                        cursorColor: ColorData.green,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          return null;
                        },
                        onChanged: controller.onTextChanged,
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
                          hintText: "Enter the email",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                        ),
                      ),
                      height(12),
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
                      height(13),
                      Row(
                        children: [
                          Checkbox(
                            value: controller.isChecked,
                            activeColor: ColorData.green,
                            onChanged: controller.onTapCheck,
                          ),
                          const Text(
                            "Yes, I understand  and agree to the Home Service Terms \nof Service and Privacy Policy",
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                      MaterialButton(
                        height: Get.height / 20,
                        minWidth: double.infinity,
                        color: ColorData.green,
                        onPressed: controller.isChecked
                            ? controller.onTapCreateAccount
                            : controller.onTapCreateAccountFalse,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorData.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have am account?"),
                          TextButton(
                            onPressed: controller.onTapLogin,
                            child: Text(
                              "Log in",
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
