import 'package:flutter/material.dart';

class ParametresView extends StatefulWidget {
  @override
  _ParametresViewState createState() => _ParametresViewState();
}

class _ParametresViewState extends State<ParametresView> {
  final TextEditingController sommeParJourController = TextEditingController();
  final TextEditingController tachesMaxController = TextEditingController();
  double sommeParJour = 0.0;
  int tachesMax = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Somme perçue par jour par chaque travailleur',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: sommeParJourController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Entrez la somme en euros',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Nombre maximum de tâches qu\'un travailleur peut effectuer par jour',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: tachesMaxController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Entrez le nombre maximum de tâches',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sommeParJour = double.parse(sommeParJourController.text);
                  tachesMax = int.parse(tachesMaxController.text);
                });
              },
              child: Text('Enregistrer les paramètres'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Somme perçue par jour : $sommeParJour euros',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Nombre maximum de tâches : $tachesMax',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
