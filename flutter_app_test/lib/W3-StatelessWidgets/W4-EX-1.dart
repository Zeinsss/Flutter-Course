import 'package:flutter/material.dart.';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.green),
        child: const Text(
          'My Hobbies',
          style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.none,
              color: Colors.black),
        ),
      ),
    ),
    body: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          color: const Color(0xFF646464),
          child: const Text(
            'Travelling',
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            color: const Color(0xFF646464),
            child: const Row(
              children: [
                Icon(
                  Icons.
                ),
                Text(
                  'Travelling',
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            )),
      ],
    ),
  )));
}
