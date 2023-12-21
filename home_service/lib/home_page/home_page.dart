import 'package:cached_network_image/cached_network_image.dart';
import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/category_pages/category_vise_services.dart';
import 'package:home_service/controller/home_page_controller.dart';
import 'package:home_service/generated/assets.dart';
import 'package:home_service/utils/drawer.dart';
import 'package:home_service/utils/utils.dart';

import '../data manager/firebase_data_handle.dart';
import '../model/service_model.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  colum(String title, String imageString) {
    return SizedBox(
      height: 100,
      width: 68,
      child: GestureDetector(
        onTap: () {
          Get.to(CleaningScreen(), arguments: title);
        },
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorData.pinkShade1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  imageString,
                ),
              ),
            ),
            height(10),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height / 5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorData.green,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(16),
                        Text(
                          "Get Discount\nUp to 30%",
                          style: TextStyle(
                              color: ColorData.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        height(8),
                        height(8),
                        Text(
                          "ON FIRST",
                          style: TextStyle(color: ColorData.white),
                        ),
                        height(8),
                        Text(
                          "Home Cleaning ",
                          style: TextStyle(
                            color: ColorData.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      Assets.banner,
                    )
                  ],
                ),
              ),
              height(8),
              const Text(
                "Category",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              height(14),
              Row(
                children: [
                  colum(
                    "cleaning",
                    Assets.cleaning,
                  ),
                  colum(
                    "laundry",
                    Assets.wash,
                  ),
                  colum(
                    "repair",
                    Assets.tools,
                  ),
                  colum(
                    "plumbing",
                    Assets.plumbering,
                  ),
                  colum(
                    "electric",
                    Assets.electric,
                  ),
                ],
              ),
              const Text(
                "Top Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              height(10),
              StreamBuilder<List<ServiceModel>>(
                stream: DataHandler.getTopService(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final responseData = snapshot.data;
                    if (responseData != null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: CachedNetworkImage(
                                            imageUrl: responseData[index].image,
                                            placeholder: (context, url) =>
                                                Image.asset(
                                              Assets.placeholder,
                                              height: 100,
                                              width: 100,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        width(10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    color:
                                                        ColorData.blackShade1,
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
                                              margin: const EdgeInsets.only(
                                                  bottom: 70),
                                              child: IconButton(
                                                onPressed: () {
                                                  controller.onTapBookMark(
                                                      responseData[index]);
                                                },
                                                icon: Icon(
                                                  Icons.bookmark_border,
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
                                          controller
                                              .onTapCard(responseData[index]);
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
                          });
                    } else {
                      return const Text("No service found");
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
            ],
          ),
        ),
      ),
    );
  }
}
