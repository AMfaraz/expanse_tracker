import 'package:flutter/material.dart';

Icon selectingIcon(String type) {
  late IconData iconData;
  // if(type=="Food"){
  //   return const Icon(Icons.fastfood);
  // }
  // else if(type=="Shopping"){
  //   return const Icon(Icons.shopping_bag);
  // }
  // else if(type=="Entertainment"){
  //   return const Icon(Icons.games);
  // }
  // else{
  //   return const Icon(Icons.miscellaneous_services);
  // }

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
