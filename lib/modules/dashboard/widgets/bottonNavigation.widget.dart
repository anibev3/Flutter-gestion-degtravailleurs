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
    return NavigationBar(context);
  }

  // ignore: non_constant_identifier_names
  Widget NavigationBar(BuildContext context) {
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
            onTap: (value) {
              if (value == 0) {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (BuildContext context) => const TableauDeBordView(),
                ));
              }
              if (value == 1) {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (BuildContext context) => AddWorkerPage(),
                ));
              }
              if (value == 3) {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ListeTachesView(),
                ));
              }
              if (value == 4) {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ListeTachesView(),
                ));
              }
            },
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
                label: "taches",
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
