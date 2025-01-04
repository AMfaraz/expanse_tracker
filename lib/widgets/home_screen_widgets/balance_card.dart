import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utils
import '../../utils/screen_utils.dart';
import '../../utils/colors.dart';

//controller
import '../../controllers/field_controller.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({super.key});

  final fieldController = Get.find<FieldController>();

  @override
  Widget build(BuildContext context) {
    final double height = ScreenUtils.height(context);
    final double width = ScreenUtils.width(context);
    return Obx(() {
    bool expenseGincome=(fieldController.totalExpense.value>fieldController.totalIncome.value)?true:false;
    // print(expenseGincome);
      return Container(
        padding: const EdgeInsets.all(20), // Padding inside the container
        margin: const EdgeInsets.all(10),
        height: height * 0.3,
        width: double.infinity, // Margin outside the container
        decoration: BoxDecoration(
          // color: Colors.blue, // Solid blue background

          //adding gradient
          gradient: const LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
              // Colors.orangeAccent
              Color.fromRGBO(250, 146, 115, 0.75)
            ], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Total Balance Section
            const Text(
              "Total Balance",
              style: TextStyle(
                color: elementBackgroundColor,
                fontSize: 16,
              ),
            ),
            const Text(
              "\$4800.00",
              style: TextStyle(
                color: elementBackgroundColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Income and Expenses Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Income Section
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                    ),

                    // Spacing between icon and text
                    const SizedBox(width: 8),
                    
                    //income
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Income",
                          style: TextStyle(
                            color: elementBackgroundColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${fieldController.totalIncome.value}",
                          style: const TextStyle(
                            color: elementBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Expenses Section
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                    ),

                    const SizedBox(width: 8), // Spacing between icon and text

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Expenses",
                          style: TextStyle(
                            // color: Colors.white,
                            // color: (fieldController.totalExpense.value > 200)
                            color: (expenseGincome)
                                ? Colors.red
                                : Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${fieldController.totalExpense.value}",
                          style: TextStyle(
                            // color: Colors.white,
                            // color: (fieldController.totalExpense.value > 200)
                            color: (expenseGincome)
                                ? Colors.red
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    //error msg
                    // const Icon(
                    //   Icons.warning,
                    //   color: Colors.red,
                    // ),

                    (expenseGincome)?const Tooltip(
                      message: "Your expenses are more than your Income",
                      child: Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                    ):const SizedBox(),

                    // (expenseGincome)?IconButton(
                    //   tooltip: "YOu jksjaks",
                    //     icon: Icon(Icons.warning,color: Colors.red,),
                    //     onPressed: (){},
                      
                    // ):const SizedBox(),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
