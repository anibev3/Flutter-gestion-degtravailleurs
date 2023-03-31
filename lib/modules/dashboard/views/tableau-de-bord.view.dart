import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/bottonNavigation.widget.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/drawer.widget.dart';
// import 'package:projet_mars_nan/modules/dashboard/widgets/search.dart';
import 'package:projet_mars_nan/modules/gestions/controller/taches.controleur.dart';
import 'package:projet_mars_nan/modules/gestions/controller/travailleurs.controleur.dart';
import 'package:projet_mars_nan/modules/gestions/views/lib/pages/home/home.dart';

// import 'package:projet_mars_nan/modules/setting/controller/dataBase.db.dart';

class TableauDeBordView extends StatefulWidget {
  const TableauDeBordView({Key? key}) : super(key: key);

  @override
  _TableauDeBordViewState createState() => _TableauDeBordViewState();
}

class _TableauDeBordViewState extends State<TableauDeBordView> {
  // All workers
  List<Map<String, dynamic>> _journalsOfWorker = [];
  List<Map<String, dynamic>> _journalsOfTask = [];
  bool _isLoading = true;

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
    await SQLHelper.createItem(
        _nameController.text, _jobController.text, salary);
    _refreshJournalsOfWorkers();
    _refreshJournalsOfTask();
  }

  // Insert a new journal to the database
  Future<void> _addTask() async {
    // double salary = double.parse(_salaryController.text);
    await SQLTacheHelper.createTask(
        _titreController.text, _descriptionController.text, null);
    // print()
    _refreshJournalsOfWorkers();
    _refreshJournalsOfTask;
  }

  @override
  void initState() {
    super.initState();
    _refreshJournalsOfWorkers(); // Loading the diary->{agenda} when the app starts
    print("Voici les informations");
    print(_journalsOfWorker);
    print(_journalsOfWorker.length);
    _refreshJournalsOfTask();
    print(_journalsOfTask);
    print(_journalsOfTask.length);
  }

// add worker
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

// add task
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
                TextField(
                  controller: _jobController,
                  decoration: InputDecoration(
                    labelText: 'Profession',
                  ),
                ),
                TextField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
                print(_nameController.text);
                print(_jobController.text);
                // final name = _nameController.text;
                // final job = _jobController.text;
                final salary = double.parse(_salaryController.text);
                print(salary);

                // // Ajouter le travailleur à la liste des travailleurs
                // // TODO: implémenter cette méthode

                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  void _showAdTaskModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter une nouvelle tâche'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titreController,
                  decoration: InputDecoration(
                    labelText: 'Titre',
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                // TextField(
                //   controller: _salaryController,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     labelText: 'Salaire',
                //   ),
                // ),
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
                _addTask();
                print(_titreController.text);
                print(_descriptionController.text);
                // final name = _nameController.text;
                // final job = _jobController.text;
                // final salary = double.parse(_salaryController.text);
                // print(salary);

                // // Ajouter le travailleur à la liste des travailleurs
                // // TODO: implémenter cette méthode

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
                        cursorColor: const Color(0xFF5F67EA),
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
                            color: const Color(0xFF5F67EA),
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
                          MaterialPageRoute(builder: (context) => HomePage()),
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
                            _showAdTaskModal(context);
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
