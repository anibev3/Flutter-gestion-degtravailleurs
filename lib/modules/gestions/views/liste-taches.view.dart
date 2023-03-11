import 'package:flutter/material.dart';

class ListeTachesView extends StatefulWidget {
  const ListeTachesView({Key? key}) : super(key: key);

  @override
  _ListeTachesViewState createState() => _ListeTachesViewState();
}

class _ListeTachesViewState extends State<ListeTachesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amberAccent),
      child: Text("Liste des taches"),
    );
  }
}
