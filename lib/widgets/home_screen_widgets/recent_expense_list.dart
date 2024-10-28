import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utils
import '../../utils/colors.dart';

//models
import '../../model/expense.dart';

//controllers
import '../../controllers/expense_controller.dart';

class RecentExpenseList extends StatelessWidget {
  final ExpenseController expenseController;

  const RecentExpenseList({super.key,required this.expenseController});

  @override
  Widget build(BuildContext context) {
    return Expanded(

      //obx to listen to changes
      child: Obx(() {
        final List<Expense> expenses = expenseController.getExpenseList();
        return ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: elementBackgroundColor,
                  borderRadius: BorderRadius.circular(13)),
              margin: const EdgeInsets.symmetric(vertical: 15),

              //each expense
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: expenses[index].icon,
                ),
                title: Text(expenses[index].title),
                subtitle: Text(expenses[index].category),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("-\$ ${expenses[index].amount}"),
                    Text(expenses[index].date),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}



