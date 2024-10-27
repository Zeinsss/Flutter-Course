import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text(
            'This is my phone',
            style: TextStyle(fontSize: 25, color: Colors.purple[300]),
            selectionColor: Colors.amber,
          ),
        ),
        body : Center(
          child: Text(
            'Hello, my name is tithya',
            style: TextStyle(fontSize: 15, color: Colors.red[400]),
            
          ),
        )
      ),
    ),
  );
}