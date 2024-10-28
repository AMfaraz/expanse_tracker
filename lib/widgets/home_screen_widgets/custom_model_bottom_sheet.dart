import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

//utils
import '../../utils/colors.dart';
import '../../utils/functions.dart';

//controllers
import '../../controllers/field_controller.dart';
import '../../controllers/expense_controller.dart';

class CModelBottomSheet extends StatelessWidget {
  final FieldController fieldController;
  final ExpenseController expenseController;

  const CModelBottomSheet({super.key,required this.fieldController,required this.expenseController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: <Widget>[
          //title
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 15)),
              label: Text("Title"),
              hintText: "Pizza",
            ),
            keyboardType: TextInputType.text,
            controller: fieldController.titleEditingController,
          ),

          const SizedBox(
            height: 20,
          ),

          //amount
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 15)),
              label: Text("Amount"),
              hintText: "43.25",
            ),
            keyboardType: TextInputType.number,
            controller: fieldController.amountEditingController,
          ),
          const SizedBox(
            height: 20,
          ),

          // selecting category
          Obx(() {
            return Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  dropdownStyleData: DropdownStyleData(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  items: fieldController.categoryValues.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  value: fieldController.selectedCategory.value,
                  onChanged: (String? category) {
                    fieldController.selectedCategory.value = category!;
                  },
                ),
              ),
            );
          }),

          const SizedBox(
            height: 25,
          ),

          //Button for adding
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 10,
              foregroundColor: Colors.black,
              backgroundColor: cardBackgroundColor,
            ),
            onPressed: () {
              Icon icon=selectingIcon(fieldController.selectedCategory.value);
              expenseController.insert(
                title: fieldController.titleEditingController.text,
                amount:
                    double.parse(fieldController.amountEditingController.text),
                category: fieldController.selectedCategory.value,
                icon: icon,
              );
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
