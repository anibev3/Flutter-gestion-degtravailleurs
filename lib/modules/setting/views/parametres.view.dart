import 'package:flutter/material.dart';

class ParametresView extends StatefulWidget {
  const ParametresView({Key? key}) : super(key: key);

  @override
  _ParametresViewState createState() => _ParametresViewState();
}

class _ParametresViewState extends State<ParametresView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: const Text(
          "Parametre",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
