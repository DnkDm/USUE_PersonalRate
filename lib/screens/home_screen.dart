import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usue_app_rate2/mainapp/for_no_login.dart';
import 'package:usue_app_rate2/mainapp/mainsec.dart';
import 'package:usue_app_rate2/mainapp/for_login.dart';

import 'package:usue_app_rate2/screens/account_screen.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';


class HomeScreenM extends StatelessWidget {
  const HomeScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return (user == null) ? NoLogPage() : MyAppSec();

      // resizeToAvoidBottomInset: false,
      //   appBar: AppBar(
      //     title: const Text('Главная страница'),
      //     actions: [
      //       IconButton(
      //           onPressed: () {
      //             if ((user == null)) {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => const LoginScreen()),
      //               );
      //             } else {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => const AccountScreen()),
      //               );
      //             }
      //           },
      //           icon: Icon(
      //             Icons.person,
      //             color: (user == null) ? Colors.white : Colors.yellow,
      //           ))
      //     ],
      //   ),
      //   body: SafeArea(
      //     child: Center(
      //         child: (user == null)
      //             ? const Text('Контент для Не зарегистрированных')
      //             : const Text('Контент для Зарегистрированных')),
      // ),
  }


}
