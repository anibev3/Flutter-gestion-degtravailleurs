import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/gestions/controller/jointure-taskworker.controller.dart';

class DetailView extends StatefulWidget {
  final int id;
  // final Game game;

  const DetailView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Map<String, dynamic> _dataOfWorker = {};
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final dataOfWorker = await SQLJointureHelper.getworker(3);
    final dataOfWorkerTasks = await SQLJointureHelper.getTasksByUser(3);
    setState(() {
      _journals = dataOfWorkerTasks;
      _dataOfWorker = dataOfWorker as Map<String, dynamic>;
      print(_journals);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail du travailleur n°${widget.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Center(
            //   child: Text('ID : ${widget.id}'),
            // ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 52,
                      backgroundColor: Color.fromARGB(255, 0, 98, 255),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "https://img-19.commentcamarche.net/WNCe54PoGxObY8PCXUxMGQ0Gwss=/480x270/smart/d8c10e7fd21a485c909a5b4c5d99e611/ccmcms-commentcamarche/20456790.jpg",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _dataOfWorker != null
                          ? Text(
                              '${_dataOfWorker['name']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          : Text('No worker data found'),
                      SizedBox(height: 10),
                      Text(
                        "Dévéloppeur web et mobile",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 13),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              ),
                              // const SizedBox(width: 30),
                              Text(
                                // game.score.toString(),
                                "Salaire: 945.000 Fcfa",
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(width: 30),
                          // Row(
                          //   children: [
                          //     const Icon(
                          //       Icons.star,
                          //       color: Colors.red,
                          //       size: 15,
                          //     ),
                          //     Text(
                          //       // '${game.download.toString()} k',
                          //       "345",
                          //       style: const TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 12,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: const [
                  Divider(),
                  Text(
                    "Listes des taches",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
