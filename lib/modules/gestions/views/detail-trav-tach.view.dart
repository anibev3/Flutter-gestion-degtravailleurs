import 'package:flutter/material.dart';

class DetailTravTachView extends StatefulWidget {
  final int id;
  // final Game game;

  const DetailTravTachView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailTravTachViewState createState() => _DetailTravTachViewState();
}

class _DetailTravTachViewState extends State<DetailTravTachView> {
  List<String> myItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
    'Item 14',
    'Item 15',
    'Item 16',
    'Item 17',
    'Item 18',
    'Item 19',
    'Item 20',
  ];

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
                      const Text(
                        "Anibé Alexis Vianney",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailTravTachView extends StatefulWidget {
//   final int id;

//   const DetailTravTachView({Key? key, required this.id}) : super(key: key);

//   @override
//   _DetailTravTachViewState createState() => _DetailTravTachViewState();
// }

// class _DetailTravTachViewState extends State<DetailTravTachView> {
//   Map<String, dynamic>? _workerData;

//   @override
//   void initState() {
//     super.initState();
//     _fetchWorkerData();
//   }

//   void _fetchWorkerData() async {
//     final data = await SQLHelper.getWorkerById(widget.id);
//     setState(() {
//       _workerData = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Détails du travailleur'),
//       ),
//       body: _workerData == null
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Nom: ${_workerData!['name']}'),
//                     const SizedBox(height: 16.0),
//                     Text('Fonction: ${_workerData!['fonction']}'),
//                     const SizedBox(height: 16.0),
//                     Text('Autres informations: ${_workerData!['otherInfo']}'),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
