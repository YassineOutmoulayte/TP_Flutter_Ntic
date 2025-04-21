import 'package:flutter/material.dart';




class ParametresScreen extends StatefulWidget {
  const ParametresScreen({super.key});

  @override
  State<ParametresScreen> createState() => _ParametresScreenState();
}

class _ParametresScreenState extends State<ParametresScreen> {
  bool _notificationsEnabled = false;
  bool _wifiNotifications = true;
  String _selectedLanguage = 'Français';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Activer les notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            secondary: Icon(Icons.notifications),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
            subtitle: Text(_selectedLanguage),
            onTap: () {
              _showLanguagePicker(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('À propos de l\'application'),
            subtitle: Text('Version 1.0.0'),
          ),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Notifications'),
            subtitle: Text('Wi-Fi uniquement'),
            trailing: Switch(
              value: _wifiNotifications,
              onChanged: (bool value) {
                setState(() {
                  _wifiNotifications = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Sécurité'),
            subtitle: Text('Changer le mot de passe'),
            onTap: () {
              // Naviguer vers la sécurité
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Déconnexion'),
            onTap: () {
              // Action de logout
            },
          ),
        ],
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Français', 'Anglais', 'Arabe'].map((langue) {
            return ListTile(
              title: Text(langue),
              onTap: () {
                setState(() {
                  _selectedLanguage = langue;
                });
                Navigator.pop(ctx);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
