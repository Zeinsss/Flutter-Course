import 'package:flutter/material.dart';
import 'package:flutter_app_test/W8-Modal/modal/expense.dart';
import 'package:intl/intl.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {

  late final List<Expense> currentExpenses;

  @override
  void initState() {
    super.initState();
    currentExpenses = widget.expenses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.play_circle_outline_outlined),
          title: const Text("Tithya Expense App", style: TextStyle(fontSize: 20, color: Colors.white),),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              iconSize: 40,
              onPressed: () => {
                showModalBottomSheet(context: context, builder: (BuildContext context) {
                  return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
                })
              },
            icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
          child: ListView.builder(
            itemCount: currentExpenses.length,
            itemBuilder: (context, index) => ExpenseCard(expense: currentExpenses[index])
            ),
          ),
        );
  }
}

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 20,),
          Expanded(
            flex: 4,
            child: Text(
              expense.title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ),
          const Spacer(flex: 1,),
          Icon(expense.category.icon, size: 40,),
          const SizedBox(width: 20,),
          Text(DateFormat('yyyy-MM-dd – kk:mm').format(expense.date), style: const TextStyle(fontSize: 20, color: Colors.white),),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }
}