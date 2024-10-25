import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/screen_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtils.height(context);
    final width = ScreenUtils.width(context);

    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            //balance box card
            SizedBox(
              height: height * 0.2,
              child: const Text("account detail child"),
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
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int indext) {
                    return Container(
                      decoration: BoxDecoration(
                      color: elementBackgroundColor,
                      borderRadius: BorderRadius.circular(13)
                      ),
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
                        // trailing: Text("45\$"),
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
            ),
          ],
        ),
      ),
    );
  }
}
