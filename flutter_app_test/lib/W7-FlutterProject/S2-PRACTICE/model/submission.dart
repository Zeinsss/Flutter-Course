import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/quiz.dart';

class Answer {
  final Question question;
  final String questionAnswer;

  Answer(this.question, {required this.questionAnswer});

  bool isCorrect() {
    return question.goodAnswer == questionAnswer;
  }
}

class Submission {
  final List<Answer> answers = [];

  void addAnswer(Question question, Answer answer) {
    for (var i = 0; i < answers.length; i++) {
      if (question == answers[i].question) {
        throw Exception("Only 1 answer per question");
      }
    }
    answers.add(answer);
  }


  void removeAnswer() {
    while (answers.isNotEmpty) {
      answers.removeAt(0);
    }
  }

  int getScore() {
    int result = 0;
    for (Answer answer in answers) {
      if (answer.isCorrect()) {
        result++;
      }
    }
    return result;
  }

  Answer? getAnswerFor(Question question) {
    return Answer(question, questionAnswer: question.goodAnswer);
  }
}
