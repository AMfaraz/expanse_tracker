import 'package:flutter/material.dart';

import '../../utils/screen_utils.dart';
import '../../utils/colors.dart';

class RecentExpenseList extends StatelessWidget {
  const RecentExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    final double height=ScreenUtils.height(context);
    final double width=ScreenUtils.width(context);

    return Expanded(
              child:ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int indext) {
                    return Container(
                      alignment: Alignment.center,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                          color: elementBackgroundColor,
                          borderRadius: BorderRadius.circular(13)),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      //each expense
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.fastfood,
                            color: iconColor,
                          ),
                        ),
                        title: Text("Food"),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("-\$45"),
                            Text("Today"),
                          ],
                        ),
                      ),
                    );
                  }),
            );
  }
}