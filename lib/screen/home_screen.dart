import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utilities
import '../utils/colors.dart';
import '../utils/screen_utils.dart';

//screens
import './main_screen.dart';
import './expenses_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _pages=[MainScreen(),ExpensesScreen()]; 
  RxInt _index=0.obs;

  void _onIndexChange(int index){
    _index.value=index;
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
      body: Obx(()=>_pages[_index.value]),

      //floating button for adding expense
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Circular shape
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      //clip react for rounded corners
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),

        //bottomnavigationbar to changing main body
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.grey,
          iconSize: 25,
          currentIndex: _index.value,
          onTap: _onIndexChange,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
