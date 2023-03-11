import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/session/views/splashScreen.views.dart';

import 'modules/main.modules.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenViews(),
    );
  }
}
// l'authentification de l'administrateur-
// tableau de bord de l'administrateur-
// gestion des travailleurs-
// affectation des tâches-
// mise à jour des tâches-
// paramètres de la plateforme
// volet bilan-
// simulation de paiement