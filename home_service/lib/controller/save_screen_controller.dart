import 'package:colors/colors.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';

import '../model/service_model.dart';
import '../screens.dart';

class SavePageController extends GetxController {
  onTapCard(ServiceModel serviceModel) {
    Get.toNamed(Routes.bookingScreen, arguments: serviceModel);
  }

  onTapBookMark(ServiceModel service) {
    DataHandler.removeFromSave(service);
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: ColorData.black,
        title: "Home Service",
        message: "Remove from saved services !",
        duration: const Duration(seconds: 2),
      ),
    );
    Get.toNamed(Routes.homeScreen);
  }
}
