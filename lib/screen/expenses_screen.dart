import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utils
import '../utils/colors.dart';

//controller
import '../controllers/expense_controller.dart';

//widgets
import '../widgets/recent_expense_list.dart';
import '../widgets/expenses_screen_widgets/expense_pie_chart.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({super.key});

  // final ExpenseController expenseController = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    Rx<Widget> expensesWidget = RecentExpenseList(
      // expenseController: expenseController,
      time: "month",
    ).obs;

    Rx<Widget> expensePieChart = ExpensePieChart().obs;

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          //pie chart
          // expensePieChart.value,

          Obx(() {
            return expensePieChart.value;
          }),

          //PDF download button
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextButton(
              onPressed: () {},
              child: Text("PDF Download"),
            ),
          ),

          //heading
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardBackgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Last Week
                ElevatedButton(
                    onPressed: () {
                      expensesWidget.value = RecentExpenseList(
                        time: "week",
                      );
                      expensePieChart.value = ExpensePieChart(
                        time: "week",
                      );
                    },
                    child: const Text("Week")),

                //last Month
                ElevatedButton(
                    onPressed: () {
                      expensesWidget.value = RecentExpenseList(
                        time: "month",
                      );
                      expensePieChart.value = ExpensePieChart(
                        time: "month",
                      );
                    },
                    child: const Text("Month")),

                //Year
                ElevatedButton(
                    onPressed: () {
                      expensesWidget.value = RecentExpenseList(
                        time: "year",
                      );
                      expensePieChart.value = ExpensePieChart(
                        time: "year",
                      );
                    },
                    child: const Text("Year")),
              ],
            ),
          ),

          //expense list
          Expanded(
            child: Obx(() {
              return expensesWidget.value;
            }),
          ),
        ],
      ),
    );
  }
}
