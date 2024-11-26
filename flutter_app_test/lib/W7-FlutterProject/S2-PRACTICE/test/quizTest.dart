import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/quiz.dart';
import 'package:flutter_app_test/W7-FlutterProject/S2-PRACTICE/model/submission.dart';

void main() {
  
  Question question1 = const Question(title: "2+2", possibleAnswers: ["2", "3", "4"], goodAnswer: "2");
  Question question2 = const Question(title: "Best course", possibleAnswers: ["Mobile", "Cloud"], goodAnswer: "Mobile");
  
  Answer answer1 = Answer(question1, questionAnswer: "3");
  Answer answer2 = Answer(question2, questionAnswer: "Mobile");
  Submission submissions = Submission();

  submissions.addAnswer(question1, answer1);
  submissions.addAnswer(question2, answer2);
  
  print(answer2.questionAnswer);
  print(answer2.questionAnswer == question2.goodAnswer);

  print(submissions.getAnswerFor(question1));
  int score = submissions.getScore();
  print(score);
}