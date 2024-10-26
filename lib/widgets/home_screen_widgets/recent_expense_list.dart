import 'package:flutter/material.dart';

//utils
import '../../utils/screen_utils.dart';
import '../../utils/colors.dart';

//models
import '../../model/expense.dart';

class RecentExpenseList extends StatelessWidget {
  RecentExpenseList({super.key});

  final List<Expense> expenses=Expense.getExpenseList();

  @override
  Widget build(BuildContext context) {
    final double height=ScreenUtils.height(context);
    final double width=ScreenUtils.width(context);

    return Expanded(
              child:ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      // height: height * 0.08,
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
                            Text("${expenses[index].date}"),
                          ],
                        ),
                      ),

                    );
                  }),
            );
  }
}