import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// var _format=DateFormat("dd-MM-yy");

class Expense {

  // static final List<Expense> _expenseList=[
  //   Expense(icon:Icon(Icons.fastfood),title: "Pizza", category: "Food", amount: 25, date: _format.format(DateTime.now())),
  //   Expense(icon:Icon(Icons.fastfood),title: "Pizza", category: "Food", amount: 25, date: _format.format(DateTime.now())),
  // ];

  final Icon icon;
  final String title;
  final String category;
  final double amount;
  final String date;

  Expense({required this.icon,required this.title,required this.category,required this.amount, required this.date});

  // static List<Expense> getExpenseList(){
  //   return List.from(_expenseList);
  // }

  // static void insert(){
  //   _expenseList.add(
  //     Expense(icon:Icon(Icons.fastfood),title: "Pizza", category: "Food", amount: 25, date: _format.format(DateTime.now()))
  //     );
  // }
}