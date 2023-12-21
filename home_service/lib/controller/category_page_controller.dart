import 'package:colors/colors.dart';
import 'package:get/get.dart';

import '../data manager/firebase_data_handle.dart';
import '../model/service_model.dart';
import '../screens.dart';

class CategoryPageController extends GetxController {
  onTapCard(ServiceModel serviceModel) {
    Get.toNamed(Routes.bookingScreen, arguments: serviceModel);
  }

  onTapBookMark(ServiceModel service) {
    DataHandler.saveService(service, "saved_services");
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: ColorData.black,
        title: "Home Service",
        message: "Service saved successfully !",
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
