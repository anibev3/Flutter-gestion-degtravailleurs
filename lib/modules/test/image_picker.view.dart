import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/drawer.widget.dart';
import 'package:projet_mars_nan/modules/dashboard/widgets/bottonNavigation.widget.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key});

  @override
  _ImagePickerViewState createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  File? _imageFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion d'image"),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: BottonNavigationWidget(),
      body: Column(
        children: [
          ListView(
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.photo_camera),
                    onPressed: () async => _pickImageFromCamera(),
                    tooltip: 'Tirer une photo',
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () async => _pickImageFromGallery(),
                    tooltip: 'Selectionner depuis la gallerie',
                  ),
                ],
              ),
              if (this._imageFile == null)
                const Placeholder()
              else
                Image.file(this._imageFile!),
            ],
          ),
          DialogExample(),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => this._imageFile = File(pickedFile.path));
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => this._imageFile = File(pickedFile.path));
    }
  }
}

class DialogExample extends StatefulWidget {
  const DialogExample({super.key});

  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Suppression'),
          content: const Text('Voulez vous supprimer cette image ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Retour'),
              child: const Text('Retour'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Oui'),
              child: const Text('Oui'),
            ),
          ],
        ),
      ),
      child: const Text('Suprimer'),
    );
  }
}
