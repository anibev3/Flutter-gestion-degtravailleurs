import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/gestions/controller/travailleurs.controleur.dart';
import 'package:projet_mars_nan/modules/gestions/views/detail-trav-tach.view.dart';

class ListWorkersView extends StatefulWidget {
  const ListWorkersView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListWorkersViewState createState() => _ListWorkersViewState();
}

class _ListWorkersViewState extends State<ListWorkersView> {
  // All TabWorkers
  List<Map<String, dynamic>> _tabWorkers = [];
  bool _isLoading = true;

  // This function is used to fetch all data from the database
  void _refreshTabWorkers() async {
    final data = await SQLHelper.getworkers();
    setState(() {
      _tabWorkers = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshTabWorkers(); // Loading the diary->{agenda} when the app starts
    print(_tabWorkers.length);
    print(_tabWorkers);
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
          _tabWorkers.firstWhere((element) => element['id'] == id);
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
                        // await _addItem();
                      }

                      if (id != null) {
                        // await _updateItem(id);
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
  // Future<void> _addItem() async {
  //   await SQLHelper.createItem(
  //       _titleController.text, _descriptionController.text);
  //   _refreshTabWorkers();
  // }

  // // Update an existing journal
  // Future<void> _updateItem(int id) async {
  //   await SQLHelper.updateItem(
  //       id, _titleController.text, _descriptionController.text);
  //   _refreshTabWorkers();
  // }

  // // Delete an item
  // void _deleteItem(int id) async {
  //   await SQLHelper.deleteItem(id);
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('Successfully deleted a journal!'),
  //   ));
  //   _refreshTabWorkers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 231, 231),
        appBar: AppBar(
          title: const Text('List des travailleurs'),
        ),
        body: _isLoading
            ? const Center(
                child: const CircularProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.grey,
                  strokeWidth: 5.0,
                  color: Colors.blue,
                ),
              )
            :
            // ListView.builder(
            //     itemCount: _tabWorkers.length,
            //     itemBuilder: (context, index) => Card(
            //       color: Colors.orange[200],
            //       margin: const EdgeInsets.all(3.5),
            //       child: ListTile(
            //           leading: CircleAvatar(
            //             // radius: 18,
            //             backgroundImage: NetworkImage(
            //               "https://img-19.commentcamarche.net/WNCe54PoGxObY8PCXUxMGQ0Gwss=/480x270/smart/d8c10e7fd21a485c909a5b4c5d99e611/ccmcms-commentcamarche/20456790.jpg",
            //             ),
            //           ),
            //           title: Text(_tabWorkers[index]['name']),
            //           subtitle: Text(_tabWorkers[index]['fonction']),
            //           trailing: SizedBox(
            //             width: 100,
            //             child: Row(
            //               children: [
            //                 IconButton(
            //                   icon: const Icon(Icons.edit),
            //                   onPressed: () => print("calmos"),
            //                   // _showForm(_tabWorkers[index]['id']),
            //                 ),
            //                 // IconButton(
            //                 //   icon: const Icon(Icons.delete),
            //                 //   onPressed: () =>
            //                 //       // _deleteItem(_tabWorkers[index]['id']),
            //                 //       print("calmos"),
            //                 // ),
            //                 IconButton(
            //                   icon: const Icon(Icons.remove_red_eye),
            //                   onPressed: () => Navigator.of(context)
            //                       .push(MaterialPageRoute<void>(
            //                     builder: (BuildContext context) =>
            //                         DetailTravTachView(
            //                             id: _tabWorkers[index]['id']),
            //                   )),
            //                 ),
            //               ],
            //             ),
            //           )),
            //     ),
            //   ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children:
                      // games
                      // .map(
                      //   (game) =>
                      _tabWorkers
                          .map((worker) => ListTile(
                                title: Text(worker['name']),
                                // subtitle: Text(worker['job']),
                              ))
                          .toList(),
                  // Container(
                  //   padding: const EdgeInsets.all(15),
                  //   margin: const EdgeInsets.only(bottom: 20),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       ClipRRect(
                  //         borderRadius: BorderRadius.circular(5),
                  //         child: Image.asset(
                  //           './assets/images/rl_logo.png',
                  //           width: 60,
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               'name',
                  //               style: const TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             const SizedBox(height: 5),
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       'name',
                  //                       style: TextStyle(
                  //                         color: Colors.grey.withOpacity(0.8),
                  //                       ),
                  //                     ),
                  //                     const SizedBox(height: 2),
                  //                     /* Etoille Review - Notation */
                  //                     Row(
                  //                       children: [
                  //                         const Icon(
                  //                           Icons.star,
                  //                           size: 15,
                  //                           color: Colors.amber,
                  //                         ),
                  //                         const Icon(
                  //                           Icons.star,
                  //                           size: 15,
                  //                           color: Colors.amber,
                  //                         ),
                  //                         const Icon(
                  //                           Icons.star,
                  //                           size: 15,
                  //                           color: Colors.amber,
                  //                         ),
                  //                         const Icon(
                  //                           Icons.star,
                  //                           size: 15,
                  //                           color: Colors.amber,
                  //                         ),
                  //                         Icon(
                  //                           Icons.star,
                  //                           size: 15,
                  //                           color: Colors.grey.withOpacity(0.3),
                  //                         ),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //                 /**  Bouton Install*/
                  //                 Container(
                  //                   padding: const EdgeInsets.symmetric(
                  //                     vertical: 5,
                  //                     horizontal: 15,
                  //                   ),
                  //                   decoration: BoxDecoration(
                  //                     color: const Color(0xFF5F67EA),
                  //                     borderRadius: BorderRadius.circular(15),
                  //                   ),
                  //                   child: const Text(
                  //                     'Install',
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 )
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // )
                  // .toList(),
                ),
              )

        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () => _showForm(null),
        // ),
        );
  }
}
