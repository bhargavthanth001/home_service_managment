import 'package:get/get.dart';
import 'package:home_service/screens.dart';

class IntroScreenController extends GetxController {
  void onPressedLogin() {
    Get.toNamed(Routes.loginScreen);
  }

  // void onPressedLogin() {
  //   var context = Get.context;
  //   if (context != null) {
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (buildContext) {
  //         return const AlertDialog.adaptive(
  //           title: Text('Alert ?'),
  //           content: Text(
  //               'Would you like to receive alert and reminders on approve service request ?'),
  //           actions: [
  //             TextButton(
  //               onPressed: yesAction,
  //               child: Text('Yes'),
  //             ),
  //             TextButton(
  //               onPressed: noAction,
  //               child: Text('No'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  onPressSignup() {
    Get.toNamed(Routes.signupScreen);
  }

  static void yesAction() {
    Get.offAllNamed(Routes.homeScreen);
  }

  static void noAction() {
    Get.back();
  }
}
