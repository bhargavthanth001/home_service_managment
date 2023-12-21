import 'package:admin/data%20manager/db_helper.dart';
import 'package:admin/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    DataHelper.getAllBookedServices();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.verifyScreen,
      getPages: Routes.routesList,
    );
  }
}
