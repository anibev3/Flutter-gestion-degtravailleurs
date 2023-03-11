import 'package:flutter/material.dart';

class ModalAddWorkerWidget extends StatefulWidget {
  const ModalAddWorkerWidget({Key? key}) : super(key: key);

  @override
  _ModalAddWorkerWidgetState createState() => _ModalAddWorkerWidgetState();
}

class _ModalAddWorkerWidgetState extends State<ModalAddWorkerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

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
}
