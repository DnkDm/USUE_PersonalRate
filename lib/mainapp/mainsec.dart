import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:usue_app_rate2/router/router.dart';

import 'package:usue_app_rate2/screens/account_screen.dart';
import 'package:usue_app_rate2/screens/home_screen.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';
import 'package:usue_app_rate2/screens/reset_password_screen.dart';
import 'package:usue_app_rate2/screens/singup_screen.dart';
import 'package:usue_app_rate2/screens/verify_email_screen.dart';
import 'package:usue_app_rate2/services/firebase_streem.dart';

// Firebase Авторизация - Сценарии:
//    Войти - Почта / Пароль
//    Личный кабинет
//    Зарегистрироваться - Почта / Пароль два раза
//        Подтвердить почту - Отправить письмо снова / Отменить
//    Сбросить пароль - Почта

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyAppSec());
}

class MyAppSec extends StatefulWidget {
  const MyAppSec({super.key});

  @override
  State<MyAppSec> createState() => _MyAppSecState();
}

class _MyAppSecState extends State<MyAppSec> {

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routerConfig: _router.config(),
    );
  }
}