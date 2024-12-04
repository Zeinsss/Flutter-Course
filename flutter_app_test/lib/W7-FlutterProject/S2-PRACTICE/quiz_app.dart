import 'package:flutter/material.dart';
import 'package:flutter_app_test/W5-Layout,%20Input,%20List/EXERCISE-3/screen/welcome.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/submission.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/screens/question_screen.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/screens/result_screen.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/screens/welcome_screen.dart';
import 'model/quiz.dart';

/// There are 3 screen states which are NOT_STARTED = welcome_screen, STARTED = question_screen, FINISHED = result_screen
// ignore: constant_identifier_names
enum QuizState { NOT_STARTED, STARTED, FINISHED }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quizzes, this.submissions, {super.key});

  final Quiz quizzes;
  final Submission submissions;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late List<Question> currentQuestions;

  late QuizState quizState = QuizState.NOT_STARTED;

  late Widget quizScreen = WelcomeScreen(onStartPressed: toQuestionScreen);

  int index = 0;

  @override
  void initState() {
    super.initState();
    currentQuestions = widget.quizzes.questions;
  }

  void restart() {
    setState(() {
      quizState = QuizState.NOT_STARTED;
      quizScreen = WelcomeScreen(onStartPressed: toQuestionScreen);
      widget.submissions.removeAnswer();
    });
  }

  void toQuestionScreen() {
    setState(() {
      quizState = QuizState.STARTED;
      quizScreen = QuestionScreen(onTap: setAnswer, question: currentQuestions[index]);
    });
  }

  void toResultScreen() {
    setState(() {
      quizState = QuizState.FINISHED;
      quizScreen = ResultScreen(onTap: restart, submission: widget.submissions, quiz: widget.quizzes,);
    });
  }

  void setAnswer([String? answer]) {
    if (answer != null) {
      widget.submissions.addAnswer(
        currentQuestions[index],
        Answer(currentQuestions[index], questionAnswer: answer),
      );
    }
    setState(() {
      if (index + 1 < currentQuestions.length) {
        index++;
        quizScreen = QuestionScreen( onTap: setAnswer, question: currentQuestions[index]);
      } else {
        /// Quiz finished
        /// Restart the counter
        index = 0;
        quizState = QuizState.FINISHED;
        quizScreen = ResultScreen( onTap: toResultScreen, submission: widget.submissions, quiz: widget.quizzes,);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: quizScreen,
        ),
      ),
    );
  }
}
