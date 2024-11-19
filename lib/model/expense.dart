import 'package:flutter/material.dart';

class Expense {

  final Icon icon;
  final String title;
  final String category;
  final double amount;
  final DateTime date;

  Expense({required this.icon,required this.title,required this.category,required this.amount, required this.date});

}