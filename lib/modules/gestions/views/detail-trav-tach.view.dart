import 'package:flutter/material.dart';

class DetailTravTachView extends StatefulWidget {
  final int id;
  const DetailTravTachView({Key? key, required this.id}) : super(key: key);

  @override
  _DetailTravTachViewState createState() => _DetailTravTachViewState();
}

class _DetailTravTachViewState extends State<DetailTravTachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail du travailleur n°${widget.id}'),
      ),
      body: Center(
        child: Text('ID : ${widget.id}'),
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
