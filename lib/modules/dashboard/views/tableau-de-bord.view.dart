import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/bottonNavigation.widget.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/drawer.widget.dart';
import 'package:projet_mars_nan/modules/gestions/views/gestion-travailleurs.view.dart';
import 'package:projet_mars_nan/modules/gestions/views/liste-travailleur.view.dart';

class TableauDeBordView extends StatefulWidget {
  const TableauDeBordView({Key? key}) : super(key: key);

  @override
  _TableauDeBordViewState createState() => _TableauDeBordViewState();
}

class _TableauDeBordViewState extends State<TableauDeBordView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  void _showAddWorkerModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un travailleur'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
                TextField(
                  controller: _jobController,
                  decoration: InputDecoration(
                    labelText: 'Profession',
                  ),
                ),
                TextField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Salaire',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                final name = _nameController.text;
                final job = _jobController.text;
                final salary = double.parse(_salaryController.text);

                // Ajouter le travailleur à la liste des travailleurs
                // TODO: implémenter cette méthode

                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: const Text('Gestion des travailleurs'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, //Center Row contents horizontally,
                // crossAxisAlignment: CrossAxisAlignment.center //Center Row contents vertically,
                children: [
                  // Text(
                  //   'Bienvenue sur l\'application de gestion des travailleurs !',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 24),
                  // ),
                  // SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      _showAddWorkerModal(context);
                    },
                    // onPressed: () => _showAddWorkerModal(context),
                    child: Text('Ajouter un Tra'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Naviguer vers la page d'affectation des tâches
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GestionTravailleursView()),
                      );
                    },
                    child: Text('Affecter tâche'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Naviguer vers la page de mise à jour des tâches
                    },
                    child: Text('Update tâche'),
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "Nombre total de travailleurs : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "Nombre total de taches : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "Nombre de taches terminé : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      child: Image.asset(
                        "assets/images/1.jpeg",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final WorkersList _workersList = WorkersList();
  List<Worker> get workers => _workersList.workers;
}
