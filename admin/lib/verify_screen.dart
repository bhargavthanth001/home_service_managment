import 'package:admin/controller/verify_screen_controller.dart';
import 'package:admin/utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:colors/colors.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

  VerifyScreenController controller = Get.put(VerifyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              height(100),
              const Text(
                "Hello Admin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              height(50),
              const Text(
                "Enter pin to verify",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              height(50),
              GetBuilder<VerifyScreenController>(
                builder: (logic) {
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.pin,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          validator: (value) {
                            debugPrint(value);
                            debugPrint(value!.length.toString());
                            if (value == null || value.isEmpty) {
                              return 'Can\'t be empty';
                            } else if (value.length < 4 || value.length > 4) {
                              return "pin have only 4 numbers";
                            } else if (value != "1234") {
                              return "invalid pin";
                            }
                          },
                          onChanged: controller.onTextChanged,
                          decoration: InputDecoration(
                            hintText: "Enter the pin",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorData.green,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorData.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
