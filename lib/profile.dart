import 'package:flutter/material.dart';

class ProfieScreen extends StatelessWidget {
  const ProfieScreen({super.key});

   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://img.freepik.com/vecteurs-premium/icone-profil-avatar-dans-style-plat-illustration-vectorielle-du-profil-utilisateur-feminin-fond-isole-concept-entreprise-signe-profil-feminin_157943-38866.jpg?semt=ais_hybrid&w=740'),
                ),
                SizedBox(height: 16),
                Text(
                  "Yassine Outmoulayte",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "outmoulayteyassine1223@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 16),
                Text(
                  "je suis Développeur mobile passionné par Flutter et les nouvelles technologies. J'aime construire des apps utiles.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
