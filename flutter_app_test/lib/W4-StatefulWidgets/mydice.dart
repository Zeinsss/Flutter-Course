import 'dart:math';

import 'package:flutter/material.dart';

const String diceImage1 = 'assets/dice-images/dice-1.png';
const String diceImage2 = 'assets/dice-images/dice-2.png';
const String diceImage3 = 'assets/dice-images/dice-3.png';
const String diceImage4 = 'assets/dice-images/dice-4.png';
const String diceImage5 = 'assets/dice-images/dice-5.png';
const String diceImage6 = 'assets/dice-images/dice-6.png';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  String activeDiceImage = diceImage2;

  void rollDice() {
    setState(() {
      final randomRoll = Random().nextInt(6) + 1;
      activeDiceImage = 'assets/dice-images/dice-$randomRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: rollDice,
          child: Image.asset(activeDiceImage, width: 200, height: 100),  
        ),
        SizedBox(
          height: 20,
          child: TextButton(onPressed: rollDice, child: const Text("Click")),
        )
      ],
    );
  }
}

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[200],
        body: const Center(child: Dice()),
      ),
    ),
  );
}
