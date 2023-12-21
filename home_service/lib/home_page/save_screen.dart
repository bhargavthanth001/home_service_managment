import 'package:cached_network_image/cached_network_image.dart';
import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/controller/save_screen_controller.dart';
import 'package:home_service/generated/assets.dart';
import 'package:home_service/utils/drawer.dart';

import '../data manager/firebase_data_handle.dart';
import '../model/service_model.dart';
import '../utils/utils.dart';

class SaveScreen extends StatelessWidget {
  SaveScreen({super.key});

  final SavePageController controller = Get.put(SavePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        appBar: AppBar(
          title: const Text("Saved Services"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<ServiceModel>>(
          future: DataHandler.getServices('saved_services'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final responseData = snapshot.data;
              debugPrint(responseData.toString());
              if (responseData != null && responseData.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: responseData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: CachedNetworkImage(
                                    imageUrl: responseData[index].image,
                                    placeholder: (context, url) => Image.asset(
                                      Assets.placeholder,
                                      height: 100,
                                      width: 100,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width(10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      responseData[index].name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "₹${responseData[index].price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorData.green,
                                      ),
                                    ),
                                    height(40),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: ColorData.yellow,
                                          size: 20,
                                        ),
                                        width(3),
                                        Text(
                                          responseData[index].rating,
                                          style: TextStyle(
                                            color: ColorData.blackShade1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 70),
                                      child: IconButton(
                                        onPressed: () {
                                          controller.onTapBookMark(
                                              responseData[index]);
                                        },
                                        icon: Icon(
                                          Icons.bookmark,
                                          color: ColorData.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.onTapCard(responseData[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorData.green),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                    color: ColorData.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    "No save service found",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorData.greenShade1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorData.green,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
