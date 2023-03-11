import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/dashboard/views/tableau-de-bord.view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez saisir votre nom d\'utilisateur';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
