import 'package:flutter/material.dart';

class TravaileurScreen extends StatelessWidget {
  final List<Worker> workers;

  const TravaileurScreen({Key? key, required this.workers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des travailleurs'),
      ),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (context, index) {
          final worker = workers[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(worker.name),
              subtitle: Text(worker.job),
              trailing: Text('${worker.salary} \$'),
              onTap: () {
                // Naviguer vers la page de détails du travailleur
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers la page d'ajout d'un travailleur
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Worker {
  final String name;
  final String job;
  final double salary;

  Worker({required this.name, required this.job, required this.salary});
}
