void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = [
    'margherita', 
    'pepperoni', 
    // 'pineapple'
  ];

  // Your code
  double total = 0.0;

  final errorOrder = List.from(order);

  String errorFood = "";

  pizzaPrices.forEach((key, value) {
    while(errorOrder.isNotEmpty) {
      if (errorOrder.first == key) {
        total += value;
        errorOrder.remove(key);
        break;
      }
      else if (errorOrder.first != key) {
        errorFood = errorOrder.first;
        break;
      }
    }
  });
  
  if (errorOrder.isEmpty) {
    print("Total: $total");
  }
  else {
    print("$errorFood is not in the menu");
  }

  
}

