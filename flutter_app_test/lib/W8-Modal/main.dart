import 'package:flutter/material.dart';
import 'package:flutter_app_test/W8-Modal/modal/expense.dart';
import 'package:flutter_app_test/W8-Modal/view/expense_screen.dart';
import 'package:uuid/uuid.dart';

void main() {

  Expense expense1 = Expense(ExpenseType.FOOD, title: "Food Stuff", amount: 3.14);
  Expense expense2 = Expense(ExpenseType.TRAVEL, title: "Go to Texas", amount: 3.14);
  Expense expense3 = Expense(ExpenseType.TRAVEL, title: "Go to Texas", amount: 3.14);
  Expense expense4 = Expense(ExpenseType.TRAVEL, title: "Go to Texas", amount: 3.14);
  Expense expense5 = Expense(ExpenseType.TRAVEL, title: "Go to Texas", amount: 3.14);
  Expense expense6 = Expense(ExpenseType.TRAVEL, title: "Go to Texas", amount: 3.14);
  Expense expense7 = Expense(ExpenseType.TRAVEL, title: "Go to Texas", amount: 3.14);

  List<Expense> expenses = [expense1, expense2, expense3, expense4, expense5, expense6, expense7];

  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenseApp(expenses: expenses)
    ));
}