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

// import 'package:flutter/material.dart';
// import 'package:projet_mars_nan/modules/gestions/views/liste-travailleur.view.dart';

// class WorkersProvider extends InheritedWidget {
//   final WorkersList workersList;

//   WorkersProvider({required this.workersList, required Widget child})
//       : super(child: child);

//   static WorkersProvider? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<WorkersProvider>();
//   }

//   @override
//   bool updateShouldNotify(WorkersProvider oldWidget) => true;
// }

// class MyApp extends StatelessWidget {
//   final WorkersList workersList = WorkersList();

//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return WorkersProvider(
//       workersList: workersList,
//       child: MaterialApp(
//         title: 'MyApp',
//         home: const MyHomePage(),
//         routes: {
//           '/addWorker': (context) => AddWorkerPage(),
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final workersList = WorkersProvider.of(context)!.workersList;
//     final workers = workersList.getWorkers();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mes travailleurs'),
//       ),
//       body: ListView.builder(
//         itemCount: workers.length,
//         itemBuilder: (context, index) {
//           final worker = workers[index];

//           return ListTile(
//             title: Text(worker.name),
//             subtitle: Text(worker.job),
//             trailing: Text('\$${worker.salary.toStringAsFixed(2)}'),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/addWorker');
//         },
//         tooltip: 'Ajouter un travailleur',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }














// l'authentification de l'administrateur-
// tableau de bord de l'administrateur-
// gestion des travailleurs-
// affectation des tâches-
// mise à jour des tâches-
// paramètres de la plateforme
// volet bilan-
// simulation de paiement