import 'package:flutter/material.dart';
import 'package:flutter_app_test/W8-Modal/modal/expense.dart';
import 'package:flutter_app_test/W8-Modal/view/expense_screen.dart';
import 'package:uuid/uuid.dart';

void main() {

  Expense expense1 = Expense(ExpenseType.FOOD, title: "Food Stuff", amount: 3.14);
  print(expense1.id);
  print(expense1.date);
  Expense expense2 = Expense(ExpenseType.FOOD, title: "Movie", amount: 3.14);
  print(expense2.id);
  print(expense2.date);

  List<Expense> expenses = [expense1, expense2];

  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenseApp(expenses: expenses)
    ));
}