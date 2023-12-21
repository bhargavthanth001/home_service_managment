import 'package:admin/data%20manager/db_helper.dart';
import 'package:get/get.dart';

class DailyServiceScreenController extends GetxController {
  onTapComplete(String id) {
    DataHelper.completeService(id);
  }
}
