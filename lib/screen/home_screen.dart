import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utilities
import '../utils/colors.dart';
import '../utils/screen_utils.dart';

//screens
import './main_screen.dart';
import './expenses_screen.dart';

//widgets
import '../widgets/home_screen_widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _pages=[MainScreen(),ExpensesScreen()]; 
  RxInt selectedPage=0.obs;

  void onIndexChange(int index){
    selectedPage.value=index;
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtils.height(context);
    final width = ScreenUtils.width(context);

    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: AppBar(
        title: const Text("Home"),
      ),

      //main body
      body: Obx(()=>_pages[selectedPage.value]),

      //floating button for adding expense
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Circular shape
        ),

        //this adds modelbottomsheet
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context){
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              child: const Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Pizza",
                    ),
                  ),
              
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Pizza",
                    ),
                  ),
              
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Pizza",
                    ),
                  ),
                ],
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),

      //clip react for rounded corners
      bottomNavigationBar: CustomBNavigationBar(index: selectedPage, onIndexChange: onIndexChange),
    );
  }
}
