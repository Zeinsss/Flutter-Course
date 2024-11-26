import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onStartPressed});

  final VoidCallback? onStartPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(width: 400, height: 400, "assets/w7-s2/quiz-logo.png"),
        const Text(
          "My Lit Quiz",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),

        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: onStartPressed, 
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_forward),
                Text("Start Quiz")
              ],
            )),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
