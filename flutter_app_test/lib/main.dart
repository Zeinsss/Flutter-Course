import "W3-StatelessWidgets/W3-S3-PRACTICE/EX-4/main.dart";
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      child: const Column(
        children: [
          GradientButton(
              text: 'Welcome',
              beginColor: Color(0xFFffd14f),
              endColor: Color(0xFF1282ba)),
          GradientButton(
              text: 'To',
              beginColor: Color(0xFFdb3e31),
              endColor: Color(0xFF1282ba)),
          GradientButton(
              text: 'The',
              beginColor: Color(0xFF81c784),
              endColor: Color(0xFF1282ba)),
          GradientButton(
              text: 'CADT',
              beginColor: Color(0xFF2b1873),
              endColor: Color(0xFFdb3e31)),
        ],
      ),
    ),
  ));
}