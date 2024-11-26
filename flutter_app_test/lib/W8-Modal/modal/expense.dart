import 'package:uuid/uuid.dart';

// ignore: constant_identifier_names
enum ExpenseType{FOOD, TRAVEL, LEISURE, WORK}

class Expense {

  static Uuid uuid = const Uuid();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense(this.category, {required this.title, required this.amount}): id = uuid.v4(), date = DateTime.now();

}