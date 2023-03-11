import 'package:flutter/material.dart';

class ListeTravailleurView extends StatefulWidget {
  const ListeTravailleurView({Key? key}) : super(key: key);

  @override
  _ListeTravailleurViewState createState() => _ListeTravailleurViewState();
}

class _ListeTravailleurViewState extends State<ListeTravailleurView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amberAccent),
      child: Text("Liste des travailleurs"),
    );
  }
}
