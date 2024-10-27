import 'package:flutter/material.dart';

void main() {
  
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(40),
      color: Colors.blue[200],
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text(
            'CADT STUDENTS',
            style: TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.none),
          ),
        ),
      ),
    ),
  ));
}
