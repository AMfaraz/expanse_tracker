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
  final String time;
  ExpensePieChart({super.key,this.time="month"});

  final ExpenseController expenseController = Get.find<ExpenseController>();

  final  pieMap = {
    "Food": 10.0,
    "Shopping": 20.0,
    "Entertainment": 30.0,
    "Misclaneous": 40.0,
  };

  // final List<Color> pieColors = [
  //   Colors.red,
  //   Colors.yellow,
  //   Colors.blue,
  //   Colors.greenAccent,
  // ];

  final List<Color> pieColors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.lightGreen,
  ];

  setingPieMapValues() {
    double food = 0;
    double shopping = 0;
    double entertainment = 0;
    double misclaneous = 0;
    final List<Expense> expenses = expenseController.getExpenseList(time: time);

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
    pieMap.assignAll({
    "Food": food,
    "Shopping": shopping,
    "Entertainment": entertainment,
    "Misclaneous": misclaneous,
  });
  }

  @override
  Widget build(BuildContext context) {
    final double height = ScreenUtils.height(context);

    // return Obx((){
    setingPieMapValues();

      return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: height * 0.3,
            width: double.infinity,
            alignment: Alignment.center,
            child: PieChart(
              dataMap: pieMap,
              colorList: pieColors,
              // gradientList: pieGradient,

              centerText: "Expenses",
              ringStrokeWidth: 24, 
              // Set the animation duration of the pie chart 
              animationDuration: const Duration(seconds: 1), 

              //chart optins
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: true,
                showChartValuesOutside: true,
                showChartValuesInPercentage: true,
                showChartValueBackground: true,
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
    // });
  }


}
