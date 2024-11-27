import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// ignore: constant_identifier_names
enum ExpenseType{FOOD(Icons.food_bank_outlined), TRAVEL(Icons.hiking_rounded), LEISURE(Icons.airline_seat_recline_extra), WORK(Icons.work);
  final IconData icon;
  const ExpenseType(this.icon);
}

class Expense {

  static Uuid uuid = const Uuid();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense(this.category, {required this.title, required this.amount}): id = uuid.v4(), date = DateTime.now();

}