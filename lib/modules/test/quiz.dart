import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  Map<String, bool> questions = {
    "La capitale de la Cote d'Ivoire est Bonoua": false,
    "Question 2": false,
    "Question 3": true,
    "Question 4": false,
    "Question 5": true,
    "Question 6": false,
    "Question 7": true,
    "Question 8": false,
    "Question 9": true,
    "Question 10": false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // for (var entry in questions.entries)
            TextButton(
                onPressed: () {}, child: Text("${questions['Question 2']}")),
            // Text('${entry.key}: ${entry.value}',
          ],
        ),
      ),
    );
  }
}
