import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//models
import '../model/expense.dart';

var _format=DateFormat("dd-MM-yy");

class ExpenseController extends GetxController{
  ExpenseController();

  final _expenseList=[].obs;

  List<Expense> getExpenseList(){
    return List.from(_expenseList);
  }

  void insert({required String title,required String category,required double amount,required Icon icon}){
    _expenseList.add(
      Expense(icon:icon,title: title, category: category, amount: amount, date: _format.format(DateTime.now()))
      );
  }

}