import 'package:admin/data%20manager/db_helper.dart';
import 'package:admin/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colors/colors.dart';
import 'package:flutter/material.dart';

import 'model/service_model.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, constrain) {
        final cellWidth = constrain.maxWidth;
        return StreamBuilder<List<ServiceModel>>(
            stream: DataHelper.getService(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final responseData = snapshot.data;
                if (responseData != null) {
                  return Wrap(
                    children: List.generate(responseData.length, (index) {
                      return SizedBox(
                        width: cellWidth / 2,
                        child: Card(
                          child: Column(
                            children: [
                              height(12),
                              Container(
                                height: cellWidth / 2.4,
                                width: cellWidth / 2.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: CachedNetworkImage(
                                  imageUrl: responseData[index].image,
                                  placeholder: (context, url) => Image.asset(
                                    "assets/images/placeholder.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                responseData[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "₹${responseData[index].price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorData.green,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.star,
                                    color: ColorData.yellow,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    responseData[index].rating,
                                    style: TextStyle(
                                      color: ColorData.blackShade1,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return Center(
                      child: Text(
                    "No service found",
                    style: TextStyle(color: ColorData.greenShade1),
                  ));
                }
              } else {
                return Center(
                    child: Text(
                  "No Data found !!! ",
                  style: TextStyle(color: ColorData.greenShade1),
                ));
              }
            });
      }),
    );
  }
}
