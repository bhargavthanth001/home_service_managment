import 'package:admin/model/booking_model.dart';
import 'package:admin/model/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DataHelper {
  static var firestore = FirebaseFirestore.instance;

  static Future<void> addData(ServiceModel service) async {
    var data = firestore.collection("services").doc();
    service.id = data.id;
    data.set(service.toJson());
  }

  static Stream<List<ServiceModel>> getService() {
    return firestore.collection("services").snapshots().map((event) =>
        event.docs.map((e) => ServiceModel.fromJson(e.data())).toList());
  }

  static Stream<List<BookingModel>> getBookedServices() {
    DateTime dateTime = DateTime.now();
    final date = DateFormat("dd-MM-yyyy").format(dateTime);

    return firestore
        .collection("booked_service")
        .doc(date)
        .collection("services")
        .snapshots()
        .map((event) =>
            event.docs.map((e) => BookingModel.fromJson(e.data())).toList());
  }

  static Stream<List<BookingModel>> getAllBookedServices() {
    return firestore.collection("booked_service").snapshots().map((event) =>
        event.docs.map((e) => BookingModel.fromJson(e.data())).toList());
  }

  static Future<void> completeService(String id) async {
    DateTime dateTime = DateTime.now();
    final date = DateFormat("dd-MM-yyyy").format(dateTime);
    await firestore
        .collection("booked_service")
        .doc(date)
        .collection("services")
        .doc(id)
        .update({"isConfirmed": true});
  }
}
