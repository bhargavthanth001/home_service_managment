import 'package:colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/model/booking_model.dart';
import 'package:home_service/model/service_model.dart';
import 'package:home_service/model/user_model.dart';
import 'package:home_service/screens.dart';
import 'package:home_service/utils/utils.dart';
import 'package:intl/intl.dart';

class BookServicePageController extends GetxController {
  final count = TextEditingController();
  final address = TextEditingController();
  double totalPrice = 0.0;
  var formKey = GlobalKey<FormState>();

  onTapBookNow(ServiceModel service) async {
    final _count = double.parse(count.text);
    final split_price = service.price.split("/");
    final s_price = double.parse(split_price[0]);
    final UserModel? user = await DataHandler.getCurrentUserData();
    final username = "${user!.fName} ${user.lName}";
    final BookingModel book = BookingModel(
      serviceName: service.name,
      servicePrice: s_price,
      count: _count,
      totalPrice: _count * s_price,
      userId: user.id!,
      userName: username,
      address: address.text,
      isConfirmed: false,
      bookedAt: DateFormat("dd-MM-yyyy").format(DateTime.now()),
    );
    DataHandler.bookService(book);
    DataHandler.saveService(service, 'my_services');
    Get.toNamed(Routes.homeScreen);
    count.text = "";
    address.text = "";
    Get.snackbar(
      "Home Service",
      "Service booked successfully !!! ",
      colorText: ColorData.white,
      backgroundColor: ColorData.green,
    );
  }
}
