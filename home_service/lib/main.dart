// ignore: depend_on_referenced_packages
import 'package:colors/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service/data%20manager/firebase_data_handle.dart';
import 'package:home_service/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD8tXyDlM0ei9bjOHV5PrpS8Tp4GaN74Fk",
      appId: "1:966832265453:android:1d8462248d38feabcd14e4",
      messagingSenderId: "966832265453",
      projectId: "home-service-1f63e",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(appBarTheme: AppBarTheme(backgroundColor: ColorData.green)),
      initialRoute: DataHandler.auth.currentUser == null
          ? Routes.splashScreen
          : Routes.homeScreen,
      getPages: Routes.routeList,
    );
  }
}
