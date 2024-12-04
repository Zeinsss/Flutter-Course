import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool dateSelected = false;

  String get formatDate => DateFormat.yMd().format(selectedDate);
  String get title => _titleController.text;
  Category type = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  Future<void> onAdd() async {
    // 1- Get the values from inputs
    String title = '';
    double amount = 0.0;

    try {
      title = _titleController.text;
    } catch (e) {
      await showAlertDialog("Title invalid", "The title cannot be empty");
    }

    try {
      amount = double.parse(_valueController.text);
    } catch (e) {
      await showAlertDialog(
          "Amount Invalid", "This amount cannot be negative number");
    }

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate, //  TODO :  For now it s a fake data
        category: type); //  TODO :  For now it s a fake data

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  Future showAlertDialog(String title, String message) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: const Text("OK"))
            ],
          );
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: _valueController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      prefix: Text('\$ '),
                      label: Text('Amount'),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    dateSelected ? Text(formatDate) : const Text("No Date Selected"),
                    IconButton(onPressed: () => _selectDate(context), icon: const Icon(Icons.date_range)),
                  ],
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: DropdownButton<Category>(
                    menuWidth: 150,
                    items: Category.values.map((Category category) {
                      return DropdownMenuItem<Category>(
                        value: category,
                        child: Text(category.toString().split('.').last),
                      );
                    }).toList(),
                    onChanged: (Category? newValue) {
                      setState(() {
                        type = newValue!;
                      });
                    },
                    value: type,
                  ),
                ),
                const Spacer(flex: 2),
                ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: onAdd, child: const Text('Create')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
