import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/controller/update.model.dart';

// class UpdateTacheScreen extends StatelessWidget {
//   final Tache tache;
//   final Travailleur travailleur;

//   UpdateTacheScreen({required this.tache, required this.travailleur});

//   @override
//   Widget build(BuildContext context) {
//     // Your code for the UpdateTacheScreen widget
//   }
// }

class UpdateTacheScreen extends StatefulWidget {
  final Travailleur travailleur;
  final Tache tache;

  UpdateTacheScreen({required this.travailleur, required this.tache});

  @override
  _UpdateTacheScreenState createState() => _UpdateTacheScreenState();
}

class _UpdateTacheScreenState extends State<UpdateTacheScreen> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.tache.statut;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mettre à jour une tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom du travailleur : ${widget.travailleur.nom}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description de la tâche : ${widget.tache.description}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Statut de la tâche :',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            // DropdownButton<String>(
            //   value: dropdownValue,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue = newValue!;
            //     });
            //   },
            //   items: <String>[
            //     'En cours',
            //     'Terminé',
            //     'Non-terminé',
            //   ].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),

            DropdownButton<String>(
              value: 'En cours',
              items: <String>[
                'En cours',
                'Terminé',
                'Non-terminé',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                print(newValue);
              },
            ),

            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.tache.statut = dropdownValue;
                });
                Navigator.pop(context);
              },
              child: Text('Enregistrer les modifications'),
            ),
          ],
        ),
      ),
    );
  }
}
