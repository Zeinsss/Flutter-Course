import 'package:flutter/material.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/submission.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');
  Question q3 = const Question(
      title: "What is 2 + 2?",
      possibleAnswers: ["2", "3", "4"],
      goodAnswer: "4");

  List<Question> myQuestions = [q1, q2,q3];
  Quiz myQuiz = Quiz(title: "Crazy Quiz", questions: myQuestions);

  Submission submissions = Submission();

  runApp(QuizApp(myQuiz, submissions));
}
