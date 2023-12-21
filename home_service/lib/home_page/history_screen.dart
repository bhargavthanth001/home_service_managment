import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/model/service_model.dart';
import 'package:home_service/utils/drawer.dart';

import '../utils/utils.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        appBar: AppBar(
          title: const Text(
            "History",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<List<ServiceModel>>(
            future: DataHandler.getServices("my_services"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final responseData = snapshot.data;
                if (responseData != null && responseData.isNotEmpty) {
                  return ListView.builder(
                    itemCount: responseData.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  responseData[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                height(16),
                                Text(
                                  responseData[index].price,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  dateFormat(responseData[index].createdAt),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      "No history found",
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
      ),
    );
  }
}
