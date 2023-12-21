import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/model/booking_model.dart';

import '../utils/drawer.dart';
import '../utils/utils.dart';

class MyServices extends StatelessWidget {
  const MyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        appBar: AppBar(
          title: const Text(
            "My Services",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: StreamBuilder<List<BookingModel>>(
            stream: DataHandler.getMyService(),
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
                                  responseData[index].serviceName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                height(16),
                                responseData[index].isConfirmed == true
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.done_all,
                                            color: ColorData.green,
                                            size: 18,
                                          ),
                                          width(5),
                                          Text(
                                            "confirmed",
                                            style: TextStyle(
                                              color: ColorData.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Icon(
                                            Icons.timelapse,
                                            color: ColorData.yellow,
                                            size: 18,
                                          ),
                                          width(5),
                                          Text(
                                            "pending",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: ColorData.yellow,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      )
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
                      "No service found",
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorData.greenShade1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
