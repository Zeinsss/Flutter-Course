import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.title,
    required this.beginColor,
    required this.endColor,
  });

  final String title;
  final Color beginColor;
  final Color endColor;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: <Color>[
                beginColor, 
                endColor
              ])),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      child: const Column(
        children: [
          GradientButton(title: 'Welcome', beginColor: Color(0xFFffd14f), endColor: Color(0xFF1282ba)),
          GradientButton(title: 'To', beginColor: Color(0xFFdb3e31), endColor: Color(0xFF1282ba)),
          GradientButton(title: 'The', beginColor: Color(0xFF81c784), endColor: Color(0xFF1282ba)),
          GradientButton(title: 'CADT', beginColor: Color(0xFF2b1873), endColor: Color(0xFFdb3e31)),
        ],
      ),
    ),
  ));
}
