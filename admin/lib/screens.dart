import 'package:admin/daily_services_page.dart';
import 'package:admin/history_page.dart';
import 'package:admin/home_page.dart';
import 'package:admin/verify_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String verifyScreen = "/verify_screen";
  static const String homeScreen = "/home_page";
  static const String dailyService = "/daily_services_page";
  static const String historyPage = "/history_page";

  static List<GetPage<dynamic>> routesList = [
    GetPage(
      name: Routes.verifyScreen,
      page: () => VerifyScreen(),
      binding: null,
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomePage(),
      binding: null,
    ),
    GetPage(
      name: Routes.dailyService,
      page: () => DailyService(),
      binding: null,
    ),
    GetPage(
      name: Routes.historyPage,
      page: () => const HistoryPage(),
      binding: null,
    ),
  ];
}
