import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/W8-Modal/S2-Practice/models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  
  void onPressed() {
    String title = _titleController.text;
    double amount = double.parse(_amountController as String);

     Expense expense = Expense(
        title: title,
        amount: amount,
        date: DateTime.now(),
        category: Category.food);

    print(expense);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 50,
            decoration: const InputDecoration(prefixText: "\$", label: Text("Amount")),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], 
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: onPressed, child: const Text("Print Value"))
        ],
      ),
    );
  }
}
