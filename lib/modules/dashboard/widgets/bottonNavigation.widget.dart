import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/views/tableau-de-bord.view.dart';
import 'package:projet_mars_nan/modules/gestions/views/liste-taches.view.dart';
import 'package:projet_mars_nan/modules/gestions/views/liste-travailleur.view.dart';
import 'package:projet_mars_nan/modules/setting/views/parametres.view.dart';

class BottonNavigationWidget extends StatelessWidget {
  BottonNavigationWidget({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    const TableauDeBordView(),
    const ParametresView(),
    AddWorkerPage(),
    const ListeTachesView()
  ];

  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar();
  }

  // ignore: non_constant_identifier_names
  Widget NavigationBar() {
    return Container(
      color: const Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFF5F67EA),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                label: 'Accueil',
                icon: Icon(
                  Icons.home_rounded,
                  size: 50,
                ),
              ),
              BottomNavigationBarItem(
                label: "Travailleurs",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.more_horiz_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Film",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Parametre",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    // Icons.auto_stories_rounded,
                    Icons.settings,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class BottonNavigationWidget_ extends StatefulWidget {
  const BottonNavigationWidget_({Key? key}) : super(key: key);

  @override
  _BottonNavigationWidgetState createState() => _BottonNavigationWidgetState();
}

class _BottonNavigationWidgetState extends State<BottonNavigationWidget_> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    const TableauDeBordView(),
    const ParametresView(),
    AddWorkerPage(),
    const ListeTachesView()
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
            icon: Icon(Icons.home_rounded),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Tâches',
          ),
        ],
      ),
    );
  }
}
