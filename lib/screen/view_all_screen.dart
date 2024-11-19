import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utils
import '../utils/colors.dart';

//widgets
import '../widgets/recent_expense_list.dart';

//controller
import '../controllers/expense_controller.dart';

class ViewAllScreen extends StatelessWidget {
  ViewAllScreen({super.key});

  final ExpenseController expenseController=Get.find<ExpenseController>();
  // final ExpenseController expenseController=Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: RecentExpenseList(expenseController: expenseController),
    );
  }
}