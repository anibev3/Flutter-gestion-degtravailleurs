import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/gestions/controller/jointure-taskworker.controller.dart';
import 'package:projet_mars_nan/modules/test/detailView.dart';

class Testbjointure extends StatefulWidget {
  const Testbjointure({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TestbjointureState createState() => _TestbjointureState();
}

class _TestbjointureState extends State<Testbjointure> {
  // All journals
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;
  bool _isUpdate = false;

  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLJointureHelper.getTasks();
    setState(() {
      _journals = data;
      print(_journals);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary->{agenda} when the app starts
    print(_journals.length);
    print(_journals);
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _etatController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  // This function will be triggered->{déclenché} when the floating button is pressed
  // It will also->{aussi} be triggered when you want to update an item
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

// Insert a new journal to the database
  SQLJointureHelper helper = SQLJointureHelper();
  Future<void> _addItem() async {
    int userId = int.parse(_userIdController.text);
    // SQLJointureHelper helper = SQLJointureHelper();

    await helper.createTask(_titleController.text, _descriptionController.text,
        _etatController.text, userId);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    // int userId = int.parse(_userIdController.text);
    await SQLJointureHelper.updateTask(id, _titleController.text,
        _descriptionController.text, _etatController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLJointureHelper.deleteTask(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQL'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                margin: const EdgeInsets.all(5),
                child: ListTile(
                    title: Text(_journals[index]['title']),
                    // subtitle: Text(_journals[index]['userId']),
                    subtitle: Text(_journals[index]['userId'].toString()),
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showForm(_journals[index]['id']);
                              setState(() {
                                _isUpdate = true;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _deleteItem(_journals[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  DetailView(id: _journals[index]['userId']),
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
