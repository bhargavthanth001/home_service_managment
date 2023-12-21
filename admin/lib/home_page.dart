import 'package:admin/controller/home_screen_controller.dart';
import 'package:admin/service_card.dart';
import 'package:admin/utils/utils.dart';
import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<HomeScreenController>(
            builder: (logic) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(40),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: const Text(
                      "Hello , Admin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  height(8),
                  GestureDetector(
                    onTap: controller.onTapToday,
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: ListTile(
                          title: const Text(
                            "Today's Services",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorData.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  height(8),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: const Text(
                      "Our Services",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  height(6),
                  const Expanded(
                    child: ServiceCard(),
                  ),
                ],
              );
            },
          )),
    );
  }
}
