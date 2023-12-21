import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:home_service/booking_screen/booking_page.dart';
import 'package:home_service/home_page/history_screen.dart';
import 'package:home_service/home_page/home_page.dart';
import 'package:home_service/home_page/my_services.dart';
import 'package:home_service/home_page/save_screen.dart';
import 'package:home_service/login/intro_screen.dart';
import 'package:home_service/login/login.dart';
import 'package:home_service/login/sign_up.dart';
import 'package:home_service/splash_screen.dart';

import 'login/otp_verification_screen.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String introScreen = '/intro_screen';
  static const String signupScreen = '/sign_up';
  static const String loginScreen = '/login';
  static const String otpScreen = '/otp_verification_screen';
  static const String homeScreen = '/home_page';
  static const String savePage = '/save_screen';
  static const String bookingScreen = '/booking_page';
  static const String historyScreen = '/history_screen';
  static const String myServiceScreen = '/my_services';

  static List<GetPage<dynamic>> routeList = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: null,
    ),
    GetPage(
      name: Routes.introScreen,
      page: () => IntroScreen(),
      binding: null,
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignUpPage(),
      binding: null,
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginPage(),
      binding: null,
    ),
    GetPage(
      name: Routes.otpScreen,
      page: () => OtpVerificationPage(),
      binding: null,
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => Homepage(),
      binding: null,
    ),
    GetPage(
      name: Routes.bookingScreen,
      page: () => BookService(),
      binding: null,
    ),
    GetPage(
      name: Routes.savePage,
      page: () => SaveScreen(),
      binding: null,
    ),
    GetPage(
      name: Routes.historyScreen,
      page: () => const History(),
      binding: null,
    ),
    GetPage(
      name: Routes.myServiceScreen,
      page: () => const MyServices(),
      binding: null,
    ),
  ];
}
