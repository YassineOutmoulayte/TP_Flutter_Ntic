import 'package:flutter/material.dart';





class AideScreen extends StatelessWidget {
  const AideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aide'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
            onTap: () {
              // Naviguer vers la page FAQ
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Contacter le support'),
            subtitle: Text('outmoulayteyassie@gmail.com'),
            onTap: () {
              // Ouvrir application email
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Appeler le support'),
            subtitle: Text('+212 6 00 00 00 00'),
            onTap: () {
              // Intégrer un appel
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('À propos de l\'application'),
            subtitle: Text('Version 1.0.0\n© 2025 Your Company'),
            isThreeLine: true,
          ),
          Divider(),
        ],
      ),
    );
  }
}
