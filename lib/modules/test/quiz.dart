import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int questionIndex = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  List<String> _questions = [
    'Question 1 : La definition de NaN est Not A Nimbé',
    'Question 2 : Le president actuelle de la CI est HKB ?',
    'Question 3 : Une variable est comme un entrepot de donnée ?',
    'Question 4 : Il y a 10 spécialité a NaN?',
    'Question 5 : Flutter permet de faire des application cross platforme ?',
    'Question 6 : Flutter utilise le Kotlin comme langage principal?',
    'Question 7 : Le directeur general de NaN Academy est M. Diomandé Keffa ?',
    'Question 8 : La superficie de la CI est de 322.460 KMˆ2 ?',
    'Question 9 : La crise en Ukraine a impacté la formation a NaN academy?',
  ];

  List<bool> reponses = [
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    false
  ];

  List<Icon> iconDeReponse = [];

  void reponseAuxQuestions(bool answer) {
    if (reponses[questionIndex] == answer) {
      iconDeReponse.add(Icon(Icons.check, color: Colors.green));
      correctAnswers++;
    } else {
      iconDeReponse.add(Icon(Icons.close, color: Colors.red));
      incorrectAnswers++;
    }

    setState(() {
      questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      iconDeReponse = [];
      correctAnswers = 0;
      incorrectAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz_View'),
        ),
        body: questionIndex < _questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _questions[questionIndex],
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () => reponseAuxQuestions(true),
                        child: Text(
                          'Vrai',
                          // style: TextStyle(
                          //     fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () => reponseAuxQuestions(false),
                        child: Text(
                          'Faux',
                          // style: TextStyle(
                          //     fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: iconDeReponse,
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Quiz terminé !',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Resultats définitive'),
                          content: Container(
                            width: 220,
                            height: 90,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Total réponses justes : $correctAnswers',
                                ),
                                Text(
                                    'Total réponses fausses : $incorrectAnswers'),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Retour'),
                              child: const Text('Retour'),
                            ),
                            TextButton(
                              onPressed: () => _resetQuiz,
                              child: const Text('Recommencer'),
                            ),
                          ],
                        ),
                      ),
                      child: Text('Voir votre resultat'),
                    ),
                  ],
                ),
              ));
  }
}
