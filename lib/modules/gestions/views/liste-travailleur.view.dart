import 'package:flutter/material.dart';

class Worker {
  final String name;
  final String job;
  final double salary;

  Worker({required this.name, required this.job, required this.salary});
}

class WorkersList {
  List<Worker> _workers = [];

  List<Worker> get workers => _workers;

  void addWorker(Worker worker) {
    _workers.add(worker);
  }

  List<Worker> getWorkers() {
    return _workers;
  }
}

class AddWorkerPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final _salaryController = TextEditingController();

  final WorkersList _workersList = WorkersList();

  AddWorkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un travailleur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                labelText: 'Travail',
              ),
            ),
            TextField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Salaire',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final job = _jobController.text;
                final salary = double.parse(_salaryController.text);
                final worker = Worker(name: name, job: job, salary: salary);
                _workersList.addWorker(worker);
                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            )
          ],
        ),
      ),
    );
  }
}
