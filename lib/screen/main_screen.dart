import 'package:flutter/material.dart';
import 'package:get/get.dart';

//screen
import '../screen/view_all_screen.dart';

//widgets
import '../widgets/recent_expense_list.dart';
import '../widgets/home_screen_widgets/balance_card.dart';

//controller
import '../controllers/expense_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final ExpenseController expenseController = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          //balance card
          BalanceCard(),

          //heading
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Expenses",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              //this will be a button
              TextButton(
                onPressed: () {
                  Get.to(() => ViewAllScreen());
                },
                child: const Text("View all"),
              ),
            ],
          ),

          //expense list
          Expanded(
            child: RecentExpenseList(
              time: "month",
            ),
          ),
        ],
      ),
    );
  }
}
