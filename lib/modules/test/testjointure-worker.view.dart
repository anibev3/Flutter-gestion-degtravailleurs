import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/bottonNavigation.widget.dart';
import 'package:projet_mars_nan/modules/gestions/controller/jointure-taskworker.controller.dart';
import 'package:projet_mars_nan/modules/gestions/views/detail-trav-tach.view.dart';

// import 'package:projet_mars_nan/modules/setting/controller/dataBase.db.dart';

class TestjointureWorkerView extends StatefulWidget {
  const TestjointureWorkerView({Key? key}) : super(key: key);

  @override
  _TestjointureWorkerViewState createState() => _TestjointureWorkerViewState();
}

class _TestjointureWorkerViewState extends State<TestjointureWorkerView> {
  // All workers
  List<Map<String, dynamic>> _journalsOfWorker = [];
  bool _isLoading = true;

  // This function is used to fetch all data from the database
  void _refreshJournalsOfWorkers() async {
    final data = await SQLJointureHelper.getworkers();
    setState(() {
      _journalsOfWorker = data;
      _isLoading = false;
    });
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    double salary = double.parse(_salaryController.text);
    await SQLJointureHelper.createWorker(
        _nameController.text, _jobController.text, salary);
    _refreshJournalsOfWorkers();
  }

  @override
  void initState() {
    super.initState();
    _refreshJournalsOfWorkers();
  }

// add worker
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

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
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: const Text('Gestion des travailleurs'),
      ),

      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                value: 0.7,
                backgroundColor: Colors.grey,
                strokeWidth: 5.0,
                color: Colors.blue,
              ),
            )
          : ListView.builder(
              itemCount: _journalsOfWorker.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                margin: const EdgeInsets.all(3.5),
                child: ListTile(
                    leading: const CircleAvatar(
                      // radius: 18,
                      backgroundImage: NetworkImage(
                        "https://img-19.commentcamarche.net/WNCe54PoGxObY8PCXUxMGQ0Gwss=/480x270/smart/d8c10e7fd21a485c909a5b4c5d99e611/ccmcms-commentcamarche/20456790.jpg",
                      ),
                    ),
                    title: Text(_journalsOfWorker[index]['name']),
                    subtitle: Text(_journalsOfWorker[index]['fonction']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => print("calmos"),
                            // _showForm(_journalsOfWorker[index]['id']),
                          ),
                          // IconButton(
                          //   icon: const Icon(Icons.delete),
                          //   onPressed: () =>
                          //       // _deleteItem(_journalsOfWorker[index]['id']),
                          //       print("calmos"),
                          // ),
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  DetailTravTachView(
                                      id: _journalsOfWorker[index]['id']),
                            )),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton:
          FloatingActionButton(onPressed: (() => _showAddWorkerModal(context))),
    );
  }
}
