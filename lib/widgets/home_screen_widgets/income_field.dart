import 'package:flutter/material.dart';
import 'package:get/get.dart';

//controller
import '../../controllers/field_controller.dart';

class IncomeField extends StatelessWidget {
  final fieldController = Get.find<FieldController>();
  // final TextEditingController incomeEditingController;

  IncomeField({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Income"),
      content: TextField(
        autofocus: true,
        keyboardType: TextInputType.number,
        controller: fieldController.incomeEditingController,
      ),
      actions: [
        TextButton(onPressed: (){
          if(fieldController.incomeEditingController.text!=""){
          fieldController.setIncome(double.parse(fieldController.incomeEditingController.text));
          }
          Navigator.of(context).pop();
        }, child: const Text("Submit")),
      ],
    );
  }
}