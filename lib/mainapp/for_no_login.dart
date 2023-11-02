import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';

class NoLogPage extends StatelessWidget {
  const NoLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003543),
        actions: [
          IconButton(
              onPressed: () {
                //FirebaseFirestore.instance.collection('item').add({'itemf':'it'});
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              icon: Icon(Icons.person), color: Colors.white,)
        ],
      ),
      backgroundColor: Color(0xFF001F28),
    );
  }
}
