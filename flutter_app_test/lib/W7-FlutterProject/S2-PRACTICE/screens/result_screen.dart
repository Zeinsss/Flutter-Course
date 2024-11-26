import 'package:flutter/material.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/quiz.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/submission.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.onTap, required this.submission, required this.quiz});

  final VoidCallback onTap;
  final Submission submission;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("You answered ${submission.getScore()} out of ${quiz.questions.length}", style: const TextStyle(fontSize: 35, color: Colors.white),)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  int num = index + 1;
                  return ResultItem(question: quiz.questions[index], answer: submission.answers[index], number: num.toString(),);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  const ResultItem({super.key, required this.question, required this.answer, required this.number});

  final String number;
  final Question question;
  final Answer answer;

  List<AnswerResult> getAnswer() {
    AnswerResult tmp;
    List<AnswerResult> answerList = [];
    for (var i = 0; i < question.possibleAnswers.length; i++) {
      /// Check if the answer is right
      if (question.goodAnswer == answer.questionAnswer) {
        /// Check if the possible answer is the correct one when submission answer is right
        if (question.possibleAnswers[i] == question.goodAnswer) {
          tmp = AnswerResult(color: Colors.green, text: question.possibleAnswers[i], icon: Icons.check,);
        }
        else {
          tmp = AnswerResult(color: Colors.white, text: question.possibleAnswers[i]);
        }
      }
      else {
        /// Check if the possible answer is the correct one when submission answer is wrong
        if (question.possibleAnswers[i] == question.goodAnswer) {
          tmp = AnswerResult(color: Colors.red, text: question.possibleAnswers[i]);
        }
        else {
          if (question.possibleAnswers[i] == answer.questionAnswer) {
            tmp = AnswerResult(color: Colors.white, text: question.possibleAnswers[i], icon: Icons.check,);
          }
          else {
            tmp = AnswerResult(color: Colors.white, text: question.possibleAnswers[i]);
          }
        }
      }
      answerList.add(tmp);
    }
    return answerList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          QuestionIdentifier(number: number, question: question, answer: answer),
          const SizedBox(width: 40,),
          Center(
            child: Column(
              children: [
                Text(question.title),
                ...getAnswer()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({super.key, required this.number, required this.question, required this.answer});

  final String number;
  final Question question;
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: ShapeDecoration(shape: const CircleBorder(), color: question.goodAnswer == answer.questionAnswer ? Colors.green : Colors.red),
      child: Center(child: Text(number, style: const TextStyle(fontSize: 20, color: Colors.white),)),
    );
  } 
}

class AnswerResult extends StatelessWidget {
  const AnswerResult({super.key, required this.color, this.icon, required this.text});

  final String text;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        icon == null ? const SizedBox(width: 20) : Icon(icon),
        Text(text, style: TextStyle(color: color))
      ],
    );
  }
}