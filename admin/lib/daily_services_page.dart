import 'package:admin/controller/daily_service_screen_controller.dart';
import 'package:admin/model/booking_model.dart';
import 'package:admin/utils/utils.dart';
import 'package:colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'data manager/db_helper.dart';

class DailyService extends StatelessWidget {
  DailyService({super.key});

  final today = DateFormat('LLL dd yyyy').format(DateTime.now());
  final DailyServiceScreenController controller =
      Get.put(DailyServiceScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.white,
      appBar: AppBar(
        backgroundColor: ColorData.green,
        title: Text(today),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<BookingModel>>(
          stream: DataHelper.getBookedServices(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final responseData = snapshot.data;
              if (responseData != null) {
                return ListView.builder(
                  itemCount: responseData.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: Get.width,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                responseData[index].userName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              height(16),
                              Text(
                                responseData[index].serviceName,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                responseData[index].address.toString(),
                              ),
                              height(5),
                              GetBuilder<DailyServiceScreenController>(
                                  builder: (logic) {
                                return responseData[index].isConfirmed
                                    ? Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: ColorData.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "confirmed",
                                          style: TextStyle(
                                            color: ColorData.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                    : SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            final bookingId =
                                                responseData[index].id;

                                            controller
                                                .onTapComplete(bookingId!);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorData.yellow),
                                          child: Text(
                                            "Confirm",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: ColorData.white),
                                          ),
                                        ),
                                      );
                              })
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
    );
  }
}
