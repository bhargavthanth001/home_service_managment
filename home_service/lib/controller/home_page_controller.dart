import 'package:colors/colors.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/model/service_model.dart';
import 'package:home_service/screens.dart';

class HomeScreenController extends GetxController {
  onTapCard(ServiceModel serviceModel) {
    Get.toNamed(Routes.bookingScreen, arguments: serviceModel);
  }

  onTapBookMark(ServiceModel service) {
    DataHandler.saveService(service, "saved_services");
    Get.showSnackbar(GetSnackBar(
      backgroundColor: ColorData.black,
      title: "Home Service",
      message: "Service saved successfully !",
      duration: const Duration(seconds: 2),
    ));
  }
}
