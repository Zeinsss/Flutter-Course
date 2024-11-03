

import 'package:flutter/material.dart.';

void onPress(){
  print('Button Clicked');
}

main () {
  return runApp(
    const MaterialApp(
      home: Column(
        children: [
          TextButton(
            onPressed: onPress, 
            child: Text('Click me'))
        ],
      ),
    )
  );
}