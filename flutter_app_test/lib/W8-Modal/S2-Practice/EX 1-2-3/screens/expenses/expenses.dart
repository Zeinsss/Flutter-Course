import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course1',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema1',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Flutter Course2',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Cinema2',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void onExpenseRemoved(Expense expense, [int? index]) {
    Expense temp = expense;
    setState(() {
      if (index != null) {
        _registeredExpenses.removeAt(index);
      }
    });
    final snackBar = SnackBar(
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () => {
                if (index != null) {
                  setState(() {
                    _registeredExpenses.insert(index, temp);
                  })
                }
              }),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _registeredExpenses.isNotEmpty
          ? ExpensesList(
              expenses: _registeredExpenses,
              onExpenseRemoved: onExpenseRemoved,
            )
          : const Center(
              child: Text("No Expenses Found!"),
            ),
    );
  }
}
