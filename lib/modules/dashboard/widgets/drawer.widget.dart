import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("GestAppUser.NaN"),
            accountEmail: Text("anibe201@gmail.com"),
            currentAccountPicture: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://img-19.commentcamarche.net/WNCe54PoGxObY8PCXUxMGQ0Gwss=/480x270/smart/d8c10e7fd21a485c909a5b4c5d99e611/ccmcms-commentcamarche/20456790.jpg",
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://www.nutanix.com/content/dam/nutanix-cxo/thumbnails/database_thumb.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/z/vecteur-d-ic%C3%B4ne-de-profil-avatar-par-d%C3%A9faut-photo-sociale-inconnue-utilisateur-m%C3%A9dias-l-184816085.jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRbiMjUoOxJCAMB9poSO2wLg34m7OxmyaT-A&usqp=CAU"),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Tableau de bord"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Liste des travaileurs"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.grid_3x3_outlined),
            title: Text("Les taches"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Parametres"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
