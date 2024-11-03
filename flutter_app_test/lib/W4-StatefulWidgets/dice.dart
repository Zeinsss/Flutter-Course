import 'dart:math';

import 'package:flutter/material.dart';

const String diceImage1 = 'assets/dice-images/dice-1.png';
const String diceImage2 = 'assets/dice-images/dice-2.png';
const String diceImage3 = 'assets/dice-images/dice-3.png';
const String diceImage4 = 'assets/dice-images/dice-4.png';
const String diceImage5 = 'assets/dice-images/dice-5.png';
const String diceImage6 = 'assets/dice-images/dice-6.png';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImage2;

  void rollDice() {
    setState(() {
      final randomNumber = Random().nextInt(6) + 1;
      activeDiceImage = 'assets/dice-images/dice-$randomNumber.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));
