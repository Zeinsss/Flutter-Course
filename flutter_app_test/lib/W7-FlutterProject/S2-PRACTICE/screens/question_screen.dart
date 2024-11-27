import 'package:flutter/material.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen(
      {super.key, required this.onTap, required this.question});

  final Function onTap;
  final Question question;

  List<AnswerCard> getPossibleAnswerCard() {
    return question.possibleAnswers
        .map((e) => AnswerCard(
              possibleAnswer: e,
              onTap: (answer) => onTap(answer), // Pass the answer to onTap
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(question.title,
                style: const TextStyle(fontSize: 40, color: Colors.white)),
          ),
        ),
        ...getPossibleAnswerCard(),
      ],
    ));
  }
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.possibleAnswer,
    required this.onTap,
  });

  final String possibleAnswer;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue[100],
      ),
      child: TextButton(
        onPressed: () {
          onTap(possibleAnswer); // Correctly invoke the function with the argument
        },  
        child: Text(
          possibleAnswer,
          style: const TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
    );
  }
}
