import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

Widget height(double height) {
  return SizedBox(
    height: height,
  );
}

Widget width(double width) {
  return SizedBox(
    width: width,
  );
}

dateFormat(String date) {
  return DateFormat("MMM dd-yyyy").format(DateTime.parse(date));
}
