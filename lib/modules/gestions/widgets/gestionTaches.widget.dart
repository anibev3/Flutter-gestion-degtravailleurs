import 'package:flutter/material.dart';

class GestionTachesWidget extends StatefulWidget {
  @override
  _GestionTachesWidgetState createState() => _GestionTachesWidgetState();
}

class _GestionTachesWidgetState extends State<GestionTachesWidget> {
  List<String> _workers = [
    'John Doe',
    'Jane Doe',
    'Bob Smith',
    'Alice Johnson',
  ];

  List<String> _tasks = [
    'Tâche 1',
    'Tâche 2',
    'Tâche 3',
    'Tâche 4',
  ];

  List<String> _selectedTasks = [];

  final _formKey = GlobalKey<FormState>();
  String? _selectedWorker;
  String? _selectedTask;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _workers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_workers[index]),
                subtitle: _selectedTasks.contains(_workers[index])
                    ? Text(_selectedTask!)
                    : null,
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _workers.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField(
                  value: _selectedWorker,
                  onChanged: (value) {
                    setState(() {
                      _selectedWorker = value!;
                    });
                  },
                  items: _workers.map((worker) {
                    return DropdownMenuItem(
                      value: worker,
                      child: Text(worker),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Travailleur',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner un travailleur';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField(
                  value: _selectedTask,
                  onChanged: (value) {
                    setState(() {
                      _selectedTask = value!;
                    });
                  },
                  items: _tasks.map((task) {
                    return DropdownMenuItem(
                      value: task,
                      child: Text(task),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Tâche',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner une tâche';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _selectedTasks.add(_selectedWorker!);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tâche assignée')),
                      );
                    }
                  },
                  child: Text('Assigner la tâche'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
