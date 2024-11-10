import 'package:flutter/material.dart';

void main() => runApp(MyCustomApp());

class MyCustomApp extends StatelessWidget {
  const MyCustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.pink[300],
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScoreBar(
                    course: "Flutter",
                    score: 3,
                  ),
                  ScoreBar(course: "Dart", score: 5),
                  ScoreBar(course: "Algorithm", score: 7)
                ],
              ),
            )));
  }
}

class ScoreBar extends StatefulWidget {
  const ScoreBar({super.key, required this.course, required this.score});

  final String course;
  final int score;

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  @override
  void initState() {
    super.initState();

    currentScore = widget.score;
  }

  late int currentScore;

  void increment() {
    setState(() {
      if (currentScore < 10) currentScore++;
    });
  }

  void decrement() {
    setState(() {
      if (currentScore > 0) currentScore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: 500,
        height: 175,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                "My Score in ${widget.course}",
                style: const TextStyle(fontSize: 30, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                    child: IconButton(
                      onPressed: decrement,
                      icon: const Icon(Icons.remove),
                      color: Colors.grey,
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: IconButton(
                        onPressed: increment,
                        icon: const Icon(Icons.add),
                        color: Colors.grey),
                  ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Container(
                    width: 40 * currentScore.toDouble(),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(30)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
