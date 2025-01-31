import 'package:flutter/material.dart';
import 'package:get/get.dart';

//screens
import './screen/home_screen.dart';

//controller
import './controllers/expense_controller.dart';
import 'package:expense_tracker/controllers/field_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpenseController>(ExpenseController());
    // Get.put<FieldController>(FieldController());
    // Get.lazyPut(()=>FieldController());
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       appBarTheme: const AppBarTheme(
        color: Colors.white70
       ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

