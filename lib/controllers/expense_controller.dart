import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//models
import '../model/expense.dart';

var _format=DateFormat("dd-MM-yy");

class ExpenseController extends GetxController{
  ExpenseController();

  final RxList<Expense> _expenseList=[
    Expense(icon:Icon(Icons.fastfood),title: "Pizza", category: "Food", amount: 25, date: _format.format(DateTime.now())),
    Expense(icon:Icon(Icons.fastfood),title: "Pizza", category: "Food", amount: 25, date: _format.format(DateTime.now())),
  ].obs;

  List<Expense> getExpenseList(){
    return List.from(_expenseList);
  }

  void insert(){
    _expenseList.add(
      Expense(icon:Icon(Icons.fastfood),title: "Pizza", category: "Food", amount: 25, date: _format.format(DateTime.now()))
      );
  }

}