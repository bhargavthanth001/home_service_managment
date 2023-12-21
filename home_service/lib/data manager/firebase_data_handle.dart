import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_service/login/otp_verification_screen.dart';
import 'package:home_service/model/booking_model.dart';
import 'package:home_service/model/user_model.dart';
import 'package:intl/intl.dart';

import '../model/service_model.dart';

class DataHandler {
  static var firestore = FirebaseFirestore.instance;
  static var auth = FirebaseAuth.instance;

  static User get user => auth.currentUser!;

  static String receiverId = '';

  static String getBookingId() {
    DateTime dateTime = DateTime.now();
    String date = DateFormat("h:mm:ss").format(dateTime);
    String id = date;
    return id;
  }

  static Future<void> addData(UserModel userModel) async {
    var newUser = firestore.collection('users').doc(user.uid);
    userModel.id = user.uid;
    newUser.set(userModel.toJson());
  }

  static Stream<List<UserModel>> getData() {
    return firestore.collection("users").snapshots().map((event) =>
        event.docs.map((e) => UserModel.fromJson(e.data())).toList());
  }

  static Future<UserModel?> getCurrentUserData() async {
    var data = await firestore
        .collection("users")
        .where("id", isEqualTo: user.uid)
        .get();
    if (data.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = data.docs.first;

      Map<String, dynamic> finalResponse =
          documentSnapshot.data() as Map<String, dynamic>;

      return UserModel.fromJson(finalResponse);
    } else {
      return null;
    }
  }

  static Future<UserModel?> getSingleUser(String mobile) async {
    var data = await firestore
        .collection("users")
        .where("mobile", isEqualTo: mobile)
        .get();
    if (data.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = data.docs.first;

      Map<String, dynamic> finalResponse =
          documentSnapshot.data() as Map<String, dynamic>;

      return UserModel.fromJson(finalResponse);
    } else {
      return null;
    }
  }

  static void verifyNumber(String mobile) async {
    await auth.verifyPhoneNumber(
      phoneNumber: mobile,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        OtpVerificationPage.verify = verificationId;
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static onVerify(
      String verificationId, String smsCode, UserModel userModel) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential).then((value) async {
      await DataHandler.addData(userModel);
    });
  }

  static signOut() async {
    await auth.signOut();
  }

  static Stream<List<ServiceModel>> getService(String category) {
    return firestore
        .collection("services")
        .where("category", isEqualTo: category)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ServiceModel.fromJson(e.data())).toList());
  }

  static Stream<List<ServiceModel>> getTopService() {
    return firestore
        .collection("services")
        .where("rating", isGreaterThanOrEqualTo: '4.5')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ServiceModel.fromJson(e.data())).toList());
  }

  static Future<void> bookService(BookingModel book) async {
    DateTime dateTime = DateTime.now();
    final date = DateFormat("dd-MM-yyyy").format(dateTime);
    var data = firestore
        .collection("booked_service")
        .doc(date)
        .collection("services")
        .doc();
    book.id = data.id;
    debugPrint("Added Data => ${book.toJson()}");
    data.set(book.toJson());
  }

  static Future<void> saveService(
      ServiceModel services, String collection) async {
    var doc = firestore
        .collection("users")
        .doc(user.uid)
        .collection(collection)
        .doc(services.id);
    final data = {
      "serviceId": services.id,
      "createdAt": DateTime.now().toLocal().toString(),
    };
    doc.set(data);
  }

  static Future<List<ServiceModel>> getServices(String collection) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userId = user.uid;

      final savedServicesQuery = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection(collection);

      final querySnapshot = await savedServicesQuery.get();
      final savedServices = <ServiceModel>[];

      for (final doc in querySnapshot.docs) {
        final serviceId = doc.data()['serviceId'] as String;
        final serviceDoc = await FirebaseFirestore.instance
            .collection('services')
            .doc(serviceId)
            .get();
        if (serviceDoc.exists) {
          savedServices.add(ServiceModel.fromJson(serviceDoc.data()!));
        }
      }

      return savedServices;
    }
    return [];
  }

  static Future<void> removeFromSave(ServiceModel services) async {
    var doc = firestore
        .collection("users")
        .doc(user.uid)
        .collection("saved_services")
        .doc(services.id);
    doc.delete();
  }

  static Stream<List<BookingModel>> getMyService() {
    DateTime dateTime = DateTime.now();
    final date = DateFormat("dd-MM-yyyy").format(dateTime);
    return firestore
        .collection("booked_service")
        .doc(date)
        .collection("services")
        .where("userId", isEqualTo: user.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => BookingModel.fromJson(e.data())).toList());
  }
}
