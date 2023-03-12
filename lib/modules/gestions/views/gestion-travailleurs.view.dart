import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/gestions/widgets/gestionTaches.widget.dart';

class GestionTravailleursView extends StatefulWidget {
  const GestionTravailleursView({super.key});

  @override
  _GestionTravailleursViewState createState() =>
      _GestionTravailleursViewState();
}

class _GestionTravailleursViewState extends State<GestionTravailleursView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const MyGestionTravailleursView(),
    const MyWorkersPage(),
    const MyTasksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des travailleurs'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Travailleurs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Tâches',
          ),
        ],
      ),
    );
  }
}

class MyGestionTravailleursView extends StatelessWidget {
  const MyGestionTravailleursView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: GestionTachesWidget());
  }
}

class MyWorkersPage extends StatefulWidget {
  const MyWorkersPage({super.key});

  @override
  _MyWorkersPageState createState() => _MyWorkersPageState();
}

class _MyWorkersPageState extends State<MyWorkersPage> {
  final List<String> _workers = [
    'John Doe',
    'Jane Doe',
    'Bob Smith',
    'Alice Johnson',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _workers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_workers[index]),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _workers.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}

class MyTasksPage extends StatefulWidget {
  const MyTasksPage({super.key});

  @override
  _MyTasksPageState createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {
  final List<String> _tasks = [
    'Nettoyer la cuisine',
    'Passer l\'aspirateur dans le salon',
    'Arroser les plantes',
    'Ranger la chambre',
  ];

  final Map<String, String> _taskStatus = {
    'Nettoyer la cuisine': 'non terminé',
    'Passer l\'aspirateur dans le salon': 'en cours',
    'Arroser les plantes': 'terminé',
    'Ranger la chambre': 'en cours',
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_tasks[index]),
          subtitle: Text(_taskStatus[_tasks[index]]!),
          trailing: DropdownButton(
            value: _taskStatus[_tasks[index]],
            onChanged: (newValue) {
              setState(() {
                _taskStatus[_tasks[index]] = newValue!;
              });
            },
            items: <String>[
              'non terminé',
              'en cours',
              'terminé',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
