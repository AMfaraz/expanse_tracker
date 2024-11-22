import 'package:get/get.dart';

//models
import '../model/expense.dart';

//utils
import '../utils/functions.dart';

//helper
import '../helper/database_helper.dart';

class ExpenseController extends GetxController{
  ExpenseController();

  final dbHelper=DatabaseHelper.instance;

  final _expenseList=[].obs;

  List<Expense> getExpenseList(){
    return List.from(_expenseList);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    addExpensesToList();
    super.onInit();
  }

  void insert(Expense expense){
    _expenseList.add(
      expense
      );
  }

  Expense fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['Title'];
    final category = json['Category'];
    final amount = json['Amount'].toDouble();
    final date = stringToDate( json['Date']);
    final icon = selectingIcon(category);
    return Expense(icon: icon, title: title, category: category, amount: amount, date: date);
  }

  Map<String, dynamic> toJson(Expense expense) {
    final Map<String, dynamic> data = {};
    data['title'] = expense.title;
    data['category'] = expense.category;
    data['amount'] = expense.amount;
    data['date'] = expense.date;
    return data;
  }

  addExpensesToList() async {
    _expenseList.clear();
    final expenses=await dbHelper.read();
    for(var expenseMap in expenses){
      final expense=fromJson(expenseMap);
      insert(expense);
    }
  }

}