import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/controller/update.model.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/bottonNavigation.widget.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/drawer.widget.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/update.v.dart';
import 'package:projet_mars_nan/modules/gestions/controller/jointure-taskworker.controller.dart';
// import 'package:projet_mars_nan/modules/dashboard/widgets/search.dart';
import 'package:projet_mars_nan/modules/gestions/controller/taches.controleur.dart';
import 'package:projet_mars_nan/modules/gestions/controller/travailleurs.controleur.dart';

// import 'package:projet_mars_nan/modules/setting/controller/dataBase.db.dart';

class TableauDeBordView extends StatefulWidget {
  const TableauDeBordView({Key? key}) : super(key: key);

  @override
  _TableauDeBordViewState createState() => _TableauDeBordViewState();
}

class _TableauDeBordViewState extends State<TableauDeBordView> {
// Liste de tâches
// List<Tache> taches = ['man', ];
// // Calcul du nombre total de tâches
// int totalTaches = taches.length;
// // Calcul du nombre de tâches terminées
// int tachesTerminees = taches.where((tache) => tache.statut == 'Terminé').length;
// // Calcul du nombre de tâches en cours
// int tachesEnCours = taches.where((tache) => tache.statut == 'En cours').length;
// // Calcul du nombre de tâches non terminées
// int tachesNonTerminees = taches.where((tache) => tache.statut == 'Non-terminé').length;
// // Calcul du pourcentage de tâches terminées
// double pourcentageTerminees = (tachesTerminees / totalTaches) * 100;

  // All workers
  List<Map<String, dynamic>> _journalsOfWorker = [];
  List<Map<String, dynamic>> _journalsOfTask = [];
  bool _isLoading = true;
  List<Map<String, dynamic>> _journals = [];

  Travailleur travailleur = Travailleur(
    id: 1,
    nom: 'Jean Dupont',
    sommeJournaliere: 50,
    tachesMaxParJour: 5,
    taches: [],
  );

  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
      _titleController.text = existingJournal['etat'];
      // _userIdController.text = existingJournal['userId'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: _etatController,
                    decoration: const InputDecoration(hintText: 'etat'),
                  ),
                  // _isUpdate
                  //     ? Text("")
                  //     :
                  TextField(
                    controller: _userIdController,
                    decoration: const InputDecoration(hintText: 'userId'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _addItem_();
                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';
                      _etatController.text = '';
                      _userIdController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

  // This function is used to fetch all data from the database
  void _refreshJournalsOfWorkers() async {
    final data = await SQLHelper.getworkers();
    setState(() {
      _journalsOfWorker = data;
      _isLoading = false;
    });
  }

  // This function is used to fetch all data from the database
  void _refreshJournalsOfTask() async {
    final data = await SQLTacheHelper.getTasks();
    setState(() {
      _journalsOfTask = data;
      _isLoading = false;
    });
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    double salary = double.parse(_salaryController.text);
    await SQLJointureHelper.createWorker(
        _nameController.text, _jobController.text, salary);
    _refreshJournalsOfWorkers();
    _refreshJournalsOfTask();
  }

  SQLJointureHelper helper = SQLJointureHelper();
  Future<void> _addItem_() async {
    int userId = int.parse(_userIdController.text);
    // SQLJointureHelper helper = SQLJointureHelper();

    await helper.createTask(_titleController.text, _descriptionController.text,
        _etatController.text, userId);
    _refreshJournals();
  }
  // Insert a new journal to the database
  // Future<void> _addTask() async {
  //   // double salary = double.parse(_salaryController.text);
  //   await SQLTacheHelper.createTask(
  //       _titreController.text, _descriptionController.text, null);
  //   // print()
  //   _refreshJournalsOfWorkers();
  //   _refreshJournalsOfTask;
  // }

  @override
  void initState() {
    super.initState();
    _refreshJournalsOfWorkers(); // Loading the diary->{agenda} when the app starts
    print("Voici les informations");
    print(_journalsOfWorker);
    print(_journalsOfWorker.length);
    _refreshJournalsOfTask();
    _refreshJournals();
    print(_journalsOfTask);
    print(_journalsOfTask.length);
  }

  void _refreshJournals() async {
    final data = await SQLJointureHelper.getTasks();
    setState(() {
      _journals = data;
      print(_journals);
      _isLoading = false;
    });
  }

// add worker
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

// add task
  // final TextEditingController _titreController = TextEditingController();
  // final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _etatController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  void _showAddWorkerModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un travailleur'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
                TextField(
                  controller: _jobController,
                  decoration: const InputDecoration(
                    labelText: 'Profession',
                  ),
                ),
                TextField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Salaire',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _addItem();
                final salary = double.parse(_salaryController.text);
                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF5F67EA),
      backgroundColor: Colors.blue,
      drawer: DrawerWidget(),
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: const Text('Gestion des travailleurs'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // voici la barre de recherche
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      TextField(
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFF6F8FF),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            size: 30,
                          ),
                          hintText: "Entrer votre recherche ici",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: const Icon(
                            Icons.mic_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // const SearchSection(),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, //Center Row contents horizontally,
                  // crossAxisAlignment: CrossAxisAlignment.center //Center Row contents vertically,
                  children: [
                    // Text(
                    //   'Bienvenue sur l\'application de gestion des travailleurs !',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 24),
                    // ),
                    // SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        _showAddWorkerModal(context);
                      },
                      // onPressed: () => _showAddWorkerModal(context),
                      child: Text('Ajouter un Tra'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Naviguer vers la page d'affectation des tâches
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => GestionTravailleursView()),
                        // );
                      },
                      child: Text('Affecter tâche'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateTacheScreen(
                                  tache: Tache(
                                      id: 0,
                                      description: '',
                                      statut: '',
                                      travailleurId: 0,
                                      travailleur: travailleur),
                                  travailleur: Travailleur(
                                      id: 0,
                                      nom: '',
                                      sommeJournaliere: 0,
                                      tachesMaxParJour: 0,
                                      taches: []))),
                        );
                      },
                      child: Text('Update tâche'),
                    ),
                  ],
                )),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, //Center Row contents horizontally,
                  // crossAxisAlignment: CrossAxisAlignment.center //Center Row contents vertically,
                  children: [
                    // Text(
                    //   'Bienvenue sur l\'application de gestion des travailleurs !',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 24),
                    // ),
                    // SizedBox(height: 30),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            _showForm(null);
                          },
                          // onPressed: () => _showAddWorkerModal(context),
                          child: Text('Ajouter une tâche'),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Naviguer vers la page d'affectation des tâches
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => GestionTravailleursView()),
                        // );
                      },
                      child: Text('Affecter tâche'),
                    ),
                    //   SizedBox(height: 10),
                    //   ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => HomePage()),
                    //       );
                    //     },
                    //     child: Text('Update tâche'),
                    //   ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Nombre total de travailleurs : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Nombre total de taches : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
