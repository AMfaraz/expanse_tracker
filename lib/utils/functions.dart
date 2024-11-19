import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Icon selectingIcon(String type) {
  late IconData iconData;

  if (type == "Food") {
    iconData = Icons.fastfood;
  } else if (type == "Shopping") {
    iconData = Icons.shopping_bag;
  } else if (type == "Entertainment") {
    iconData = Icons.games;
  } else {
    iconData = Icons.miscellaneous_services;
  }

  return Icon(iconData,color: Colors.white,);
}

String dateToString(DateTime date){
  var format=DateFormat("dd-MM-yy");
  return format.format(date);
}

DateTime stringToDate(String date){
  var format=DateFormat("dd-MM-yy");
  return format.parse(date);
}