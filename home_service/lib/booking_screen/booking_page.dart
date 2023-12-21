import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/controller/book_service_page_controller.dart';
import 'package:home_service/utils/utils.dart';

import '../model/service_model.dart';

class BookService extends StatelessWidget {
  BookService({super.key});

  final BookServicePageController controller =
      Get.put(BookServicePageController());
  final ServiceModel service = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<BookServicePageController>(
          builder: (logic) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(50),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Book Service ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  height(25),
                  Row(
                    children: [
                      Text(
                        service.category == "laundry"
                            ? "Enter the pieces : "
                            : "Enter the hours : ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const Spacer(),
                      Expanded(
                        child: TextFormField(
                          controller: controller.count,
                          keyboardType: TextInputType.number,
                          cursorColor: ColorData.green,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorData.green),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorData.green),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5),
                          ),
                        ),
                      ),
                      width(20)
                    ],
                  ),
                  height(25),
                  const Text(
                    "Address : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  height(5),
                  TextFormField(
                    controller: controller.address,
                    minLines: 4,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Enter the address",
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
                  height(40),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.onTapBookNow(service);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorData.green),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
