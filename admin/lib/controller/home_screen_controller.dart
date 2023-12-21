import 'package:admin/screens.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  onTapToday() {
    Get.toNamed(Routes.dailyService);
  }

  onTapHistory() {
    Get.toNamed(Routes.historyPage);
  }
}
