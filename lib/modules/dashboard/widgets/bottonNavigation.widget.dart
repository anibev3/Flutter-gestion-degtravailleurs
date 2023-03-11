import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/views/tableau-de-bord.view.dart';
import 'package:projet_mars_nan/modules/gestions/views/liste-taches.view.dart';
import 'package:projet_mars_nan/modules/gestions/views/liste-travailleur.view.dart';
import 'package:projet_mars_nan/modules/setting/views/parametres.view.dart';

class BottomTest extends StatefulWidget {
  @override
  _BottomTestState createState() => _BottomTestState();
}

class _BottomTestState extends State<BottomTest> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const TableauDeBordView(),
    const ParametresView(),
    const ListeTravailleurView(),
    const ListeTachesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
