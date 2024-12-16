import 'package:flutter/material.dart';
import 'package:flutter_app_test/W9-Form-Route/S2-PRACTICE/models/grocery_item.dart';
import 'package:flutter_app_test/W9-Form-Route/S2-PRACTICE/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  void toNewItem() {
    
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (context, index) {
          return GroceryTile(groceryIndex: index,);
        }
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewItem()))
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({
    super.key, required this.groceryIndex,
  });

  final int groceryIndex;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: dummyGroceryItems[groceryIndex].category.color,
          border: Border.all(width: 3)
        ),
      ),
      title: Text(dummyGroceryItems[groceryIndex].name),
      trailing: Text(dummyGroceryItems[groceryIndex].quantity.toString()),
      onTap: () {
        print("Hello");
      },
    );
  }
}
