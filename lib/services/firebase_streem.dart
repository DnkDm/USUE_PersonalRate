import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:usue_app_rate2/screens/home_screen.dart';
import 'package:usue_app_rate2/screens/verify_email_screen.dart';


class FirebaseStream extends StatelessWidget {
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text('Что-то пошло не так!')));
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const VerifyEmailScreen();
          }
          return const HomeScreenM();
        } else {
          return const HomeScreenM();
        }
      },
    );
  }
}