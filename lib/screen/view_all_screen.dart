import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utils
import '../utils/colors.dart';

//widgets
import '../widgets/recent_expense_list.dart';

//controller

class ViewAllScreen extends StatelessWidget {
  ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Rx<Widget> expensesWidget=RecentExpenseList(
              time: "month",
            ).obs;

    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: AppBar(
        title: const Text("View all"),
      ),
      body: expensesWidget.value,
    );
  }
}
