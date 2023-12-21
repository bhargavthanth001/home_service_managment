import 'package:admin/model/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('booked_service').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final responseData = snapshot.data!.docs;
            List<BookingModel> bookedServices = [];
            for (var document in responseData) {
              final data = document.data();
              bookedServices.add(BookingModel.fromJson(data));
            }
            return ListView.builder(
              itemCount: responseData.length,
              itemBuilder: (context, index) {
                debugPrint(bookedServices[index].toJson().toString());
                return Card(
                  child: Text(bookedServices[index].serviceName),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
