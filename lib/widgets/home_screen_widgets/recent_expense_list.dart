import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utils
import '../../utils/screen_utils.dart';
import '../../utils/colors.dart';

//models
import '../../model/expense.dart';

//controllers
import '../../controllers/expense_controller.dart';

class RecentExpenseList extends StatelessWidget {
  RecentExpenseList({super.key});

  final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    final double height = ScreenUtils.height(context);
    final double width = ScreenUtils.width(context);

    return Expanded(
    
      //obx to listen to changes
      child: Obx((){
        final List<Expense> expenses=expenseController.getExpenseList();
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
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.fastfood,
                    color: iconColor,
                  ),
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
          });
      }),
    );
  }
}




























//using getx controller
// child: GetX<ExpenseController>(
//         init: ExpenseController(),
//         builder: (val) {
//           final List<Expense> expenses = expenseController.getExpenseList();
//           return ListView.builder(
//               itemCount: expenses.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: elementBackgroundColor,
//                       borderRadius: BorderRadius.circular(13)),
//                   margin: const EdgeInsets.symmetric(vertical: 15),

//                   //each expense
//                   child: ListTile(
//                     leading: const CircleAvatar(
//                       backgroundColor: Colors.orange,
//                       child: Icon(
//                         Icons.fastfood,
//                         color: iconColor,
//                       ),
//                     ),
//                     title: Text(expenses[index].title),
//                     subtitle: Text(expenses[index].category),
//                     trailing: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         Text("-\$ ${expenses[index].amount}"),
//                         Text(expenses[index].date),
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         },
//       ),