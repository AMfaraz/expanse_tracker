import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utils
import '../utils/colors.dart';
import '../utils/screen_utils.dart';

//widgets
import '../widgets/home_screen_widgets/recent_expense_list.dart';

//controller
import '../controllers/expense_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final ExpenseController expenseController=Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    final double height=ScreenUtils.height(context);
    final double widget=ScreenUtils.width(context);


    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            //balance box card
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Total Balance"),
                  Text("\$ 4000.00"),

                  //income and expenses
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      //income
                      Flexible(
                        flex: 25,
                        child: ListTile(
                          leading: Icon(Icons.arrow_upward),
                          title: Text("Income"),
                          subtitle: Text("\$30000.0"),
                        ),
                      ),

                      //expenses
                      Flexible(
                        flex: 25,
                        child: ListTile(
                          leading: Icon(Icons.arrow_downward),
                          title: Text("Expenses"),
                          subtitle: Text("\$30000.0"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //heading
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Expenses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                //this will be a button
                Text("View All"),
              ],
            ),

            //expense list
            RecentExpenseList(expenseController: expenseController,),
          ],
        ),
      );
  }
}