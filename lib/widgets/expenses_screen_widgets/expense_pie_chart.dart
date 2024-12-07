import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:get/get.dart';

//utils
import '../../utils/screen_utils.dart';

//controller
import '../../controllers/expense_controller.dart';

//model
import '../../model/expense.dart';

class ExpensePieChart extends StatelessWidget {
  ExpensePieChart({super.key});

  final ExpenseController expenseController = Get.find<ExpenseController>();

  final Map<String, double> pieMap = {
    "Food": 10,
    "Shopping": 20,
    "Entertainment": 30,
    "Misclaneous": 40,
  };

  final List<Color> pieColors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.greenAccent,
  ];

  setingPieMapValues() {
    double food = 0;
    double shopping = 0;
    double entertainment = 0;
    double misclaneous = 0;
    final List<Expense> expenses = expenseController.getExpenseList();

    //summing the values
    for (var expense in expenses) {
      if (expense.category == "Food") {
        food = food + expense.amount;
      } else if (expense.category == "Shopping") {
        shopping = shopping + expense.amount;
      } else if (expense.category == "Entertainment") {
        entertainment = entertainment + expense.amount;
      } else {
        misclaneous = misclaneous + expense.amount;
      }

    }
    // setting the map value
      pieMap["Food"] = food;
      pieMap["Shopping"] = shopping;
      pieMap["Entertainment"] = entertainment;
      pieMap["Misclaneous"] = misclaneous;
  //   return {
  //   "Food": food,
  //   "Shopping": shopping,
  //   "Entertainment": entertainment,
  //   "Misclaneous": misclaneous,
  // };
    // print(expenses);
  }

  @override
  Widget build(BuildContext context) {
    final double height = ScreenUtils.height(context);
    // print("helelo this is");
    setingPieMapValues();

    return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: height * 0.3,
            width: double.infinity,
            alignment: Alignment.center,
            child: PieChart(
              dataMap: pieMap,
              colorList: pieColors,

              //chart optins
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: true,
                showChartValuesOutside: true,
                showChartValuesInPercentage: true,
                showChartValueBackground: false,
              ),

              //legend options
              legendOptions: const LegendOptions(
                showLegends: true,
                legendShape: BoxShape.rectangle,
                legendTextStyle: TextStyle(fontSize: 10),
                legendPosition: LegendPosition.right,
                showLegendsInRow: false,
              ),

            ),
          );
  }
}
