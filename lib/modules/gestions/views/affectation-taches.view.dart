import 'package:flutter/material.dart';

class AffectationTachesView extends StatefulWidget {
  const AffectationTachesView({Key? key}) : super(key: key);

  @override
  _AffectationTachesViewState createState() => _AffectationTachesViewState();
}

class _AffectationTachesViewState extends State<AffectationTachesView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Affescter tache",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
