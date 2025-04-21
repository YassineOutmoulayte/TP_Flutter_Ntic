import 'package:flutter/material.dart';
import 'package:tp_ntic/Parametres.dart';
import 'package:tp_ntic/aide.dart';
import 'package:tp_ntic/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Page Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _genre = 'Homme';
  bool _codage = false;
  bool _design = false;
  bool _gamming = false;
  String _formation = "Informatique";
  double _competenceLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "entrez votrre nom ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nomController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre nom',
              ),
            ),
            SizedBox(height: 16),
            Text(
              "entrez votre age ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre age',
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Genre :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Homme',
                  groupValue: _genre,
                  onChanged: (String? value) {
                    setState(() {
                      _genre = value!;
                    });
                  },
                ),
                Text("Homme"),
                Radio<String>(
                  value: 'Femme',
                  groupValue: _genre,
                  onChanged: (String? value) {
                    setState(() {
                      _genre = value!;
                    });
                  },
                ),
                Text("Femme"),
              ],
            ),
            Text(
              'Centres d\'intérêt :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Codage'),
              value: _codage,
              onChanged: (bool? value) {
                setState(() {
                  _codage = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text('Design'),
              value: _design,
              onChanged: (bool? value) {
                setState(() {
                  _design = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text('Jeux vidéo'),
              value: _gamming,
              onChanged: (bool? value) {
                setState(() {
                  _gamming = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Text(
              'Niveau en programmtion :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("Debutant"),
                Expanded(
                  child: Slider(
                    value: _competenceLevel,
                    min: 1.0,
                    max: 5.0,
                    divisions: 4,
                    onChanged: (double value) {
                      setState(() {
                        _competenceLevel = value;
                      });
                    },
                  ),
                ),
                Text("Expert"),
              ],
            ),
            Text(
              'Formation :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _formation,
              onChanged: (String? newValue) {
                setState(() {
                  _formation = newValue!;
                });
              },
              items:
                  <String>[
                    'Informatique',
                    'Design',
                    'Marketing',
                    'Marketing',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String nom = _nomController.text;
                  String age = _ageController.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Bonjour $nom vous avez $age ans")),
                  );
                },
                child: Text('valider'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Maneu de Navigation",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Application Flutter",
                style: TextStyle(color: Colors.white38, fontSize: 16),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Accueil'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfieScreen()),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Parametres'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ParametresScreen()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Aide'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AideScreen()),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.red),
          title: Text('Deconnexion', style: TextStyle(color: Colors.red)),
          onTap: () {},
        ),
      ],
    ),
  );
}
