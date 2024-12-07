import 'package:get/get.dart';

//models
import '../model/expense.dart';

//utils
import '../utils/functions.dart';

//helper
import '../helper/database_helper.dart';

class ExpenseController extends GetxController {
  ExpenseController();

  final dbHelper = DatabaseHelper.instance;

  final _expenseList = [].obs;

  List<Expense> getExpenseList() {
    return List.from(_expenseList);
  }

  @override
  // void onInit() {
  //   // TODO: implement onInit
  //   addExpensesToList();
  //   super.onInit();
  // }


  // String test(){
  //   return "test";
  // }

  void insert(Expense expense) {
    _expenseList.add(expense);
  }

  Expense fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['Title'];
    final category = json['Category'];
    final amount = json['Amount'].toDouble();
    final date = stringToDate(json['Date']);
    final icon = selectingIcon(category);
    return Expense(
        icon: icon,
        title: title,
        category: category,
        amount: amount,
        date: date);
  }

  Map<String, dynamic> toJson(Expense expense) {
    final Map<String, dynamic> data = {};
    data['title'] = expense.title;
    data['category'] = expense.category;
    data['amount'] = expense.amount;
    data['date'] = expense.date;
    return data;
  }


  addExpensesToList({String time = "month"}) async {
    _expenseList.clear();
    final List<Map<String, dynamic>> expenses = await dbHelper.read();
    DateTime? checkDate = null;

    for (var expenseMap in expenses) {
      final expense = fromJson(expenseMap);

      switch (time) {
        //checking if date is under a year
        case "year":
          checkDate =
              DateTime.now().subtract(const Duration(days: 365));
          checkDate = DateTime(
              checkDate.year, checkDate.month, checkDate.day);

          if (expense.date.isAfter(checkDate)) {
            insert(expense);
          }
          break;

        //checking if date is under a month
        case "month":
          checkDate =
              DateTime.now().subtract(const Duration(days: 30));
          checkDate = DateTime(
              checkDate.year, checkDate.month, checkDate.day);

          if (expense.date.isAfter(checkDate)) {
            insert(expense);
          }
          break;

        //checking if date is under a week
        case "week":
          DateTime checkDate =
              DateTime.now().subtract(const Duration(days: 7));
          checkDate = DateTime(
              checkDate.year, checkDate.month, checkDate.day);

          if (expense.date.isAfter(checkDate)) {
            insert(expense);
          }
          break;

        default:
          insert(expense);
      }
    }
  }

}








