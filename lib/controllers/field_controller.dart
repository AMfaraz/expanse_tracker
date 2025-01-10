import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FieldController extends GetxController{
  final TextEditingController titleEditingController=TextEditingController();
  final TextEditingController amountEditingController=TextEditingController();
  final TextEditingController incomeEditingController=TextEditingController();
  var selectedCategory="Food".obs;
  final List<String> categoryValues = [
    "Food",
    "Shopping",
    "Entertainment",
    "Misclaneous",
  ];
  Rx<double> totalExpense=0.0.obs;
  Rx<double> totalIncome=100.0.obs;
  Rx<bool> expenseGincome=false.obs;

  @override
  void setIncome(double income){
    totalIncome.value=income;
  }

  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    titleEditingController.dispose();
    amountEditingController.dispose();
    incomeEditingController.dispose();
    super.onClose();
  }
}