import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      color: Colors.green[300],
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100]),
            margin: const EdgeInsets.only(top: 20),
            child: const Center(
              child: Text(
                'OOP',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(colors: <Color>[
                  Color(0xFF56acf3),
                  Color(0xFFffce44),
                  Color(0xFFdb3e31)
                ], begin: Alignment.topLeft, end: Alignment(0.8, 1))),
            margin: const EdgeInsets.only(top: 20),
            child: const Center(
              child: Text(
                'DART',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(colors: <Color>[
                  Color(0xFF56acf3),
                  Color(0xFF2b1c77)
                ], begin: Alignment.topLeft, end: Alignment(0.8, 1))),
            margin: const EdgeInsets.only(top: 20),
            child: const Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
