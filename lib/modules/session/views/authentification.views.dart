// import 'package:flutter/material.dart';
// import 'package:projet_mars_nan/modules/dashboard/views/tableau-de-bord.view.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Nom d\'utilisateur',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Veuillez saisir votre nom d\'utilisateur';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Mot de passe',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Veuillez saisir votre mot de passe';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // if (_formKey.currentState!.validate()) {
//                   //   // Vérifiez si les informations de connexion sont correctes ici

//                   // }
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const TableauDeBordView()),
//                   );
//                 },
//                 child: const Text('Connexion'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/views/tableau-de-bord.view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Page d'accueil"),
        // ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            const Spacer(),
            const CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage("assets/images/1.jpeg"),
              radius: 60,
            ),
            const Text("Administrateur",
                style: TextStyle(
                  fontFamily: 'Zeyada',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                )),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                "Veuillez entrer vos acces admin",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Nom d'utilisateur",
                prefixIcon: const Icon(Icons.people),
                border: mes_bordures(),
                // enabledBorder: mes_bordures(),
                // focusedBorder: mes_focusborder(),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Mot de passe",
                prefixIcon: const Icon(Icons.key),
                border: mes_bordures(),
                // enabledBorder: mes_bordures(),
                // focusedBorder: mes_focusborder(),
              )),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   // Vérifiez si les informations de connexion sont correctes ici

                // }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TableauDeBordView()),
                );
              },
              child: const Text('Connexion'),
            ),
            const Spacer()
            // SizedBox(
            //   width: 30,
            // )
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  OutlineInputBorder mes_bordures() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 3,
        ));
  }

  // ignore: non_constant_identifier_names
  OutlineInputBorder mes_focusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }
}
