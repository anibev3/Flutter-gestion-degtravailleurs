import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/gestions/controller/taches.controleur.dart';
import 'package:projet_mars_nan/modules/gestions/views/detail-trav-tach.view.dart';
import 'package:projet_mars_nan/modules/gestions/views/lib/models/game.dart';

class ListeTachesView extends StatefulWidget {
  const ListeTachesView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListeTachesViewState createState() => _ListeTachesViewState();
}

class _ListeTachesViewState extends State<ListeTachesView> {
  // All journals
  List<Map<String, dynamic>> _journalsOfTask = [];
  bool _isLoading = true;
  final List<Game> games = Game.games();

  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLTacheHelper.getTasks();
    setState(() {
      _journalsOfTask = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary->{agenda} when the app starts
    print(_journalsOfTask.length);
    print(_journalsOfTask);
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered->{déclenché} when the floating button is pressed
  // It will also->{aussi} be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journalsOfTask.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLTacheHelper.createTask(
        _titleController.text, _descriptionController.text, null);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLTacheHelper.updateTask(
        id, _titleController.text, _descriptionController.text, null);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLTacheHelper.deleteTask(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de toutes les taches'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journalsOfTask.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    title: Text(_journalsOfTask[index]['title']),
                    subtitle: Text(_journalsOfTask[index]['description']),
                    trailing: SizedBox(
                      width: 145,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () =>
                                _showForm(_journalsOfTask[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _deleteItem(_journalsOfTask[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  DetailTravTachView(
                                      id: _journalsOfTask[index]['id']),
                            )),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
