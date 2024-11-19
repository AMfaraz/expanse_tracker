import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utilities
import '../utils/colors.dart';

//screens
import './main_screen.dart';
import './expenses_screen.dart';

//widgets
import '../widgets/home_screen_widgets/custom_bottom_navigation_bar.dart';
import '../widgets/home_screen_widgets/custom_model_bottom_sheet.dart';

//controller
import '../controllers/expense_controller.dart';
import '../controllers/field_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ExpenseController _expenseController = Get.put(ExpenseController());
  final FieldController _fieldController = Get.put(FieldController());

  final List<Widget> _pages = [MainScreen(), ExpensesScreen()];
  RxInt selectedPage = 0.obs;

  void onIndexChange(int index) {
    selectedPage.value = index;
  }

  @override
  Widget build(BuildContext context) {
    _expenseController.onInit();

    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: AppBar(
        title: const Text("Home"),
      ),

      //main body
      body: Obx(() => _pages[selectedPage.value]),

      //floating button for adding expense
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Circular shape
        ),

        //this adds modelbottomsheet
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return CModelBottomSheet(fieldController: _fieldController, expenseController: _expenseController,);
              });
        },
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: CustomBNavigationBar(
          index: selectedPage, onIndexChange: onIndexChange),
    );
  }
}
