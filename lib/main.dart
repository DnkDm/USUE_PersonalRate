import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:usue_app_rate2/screens/account_screen.dart';
import 'package:usue_app_rate2/screens/home_screen.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';
import 'package:usue_app_rate2/screens/reset_password_screen.dart';
import 'package:usue_app_rate2/screens/singup_screen.dart';
import 'package:usue_app_rate2/screens/verify_email_screen.dart';
import 'package:usue_app_rate2/services/firebase_streem.dart';
import 'package:usue_app_rate2/mainapp/person_screen.dart';

// Firebase Авторизация - Сценарии:
//    Войти - Почта / Пароль
//    Личный кабинет
//    Зарегистрироваться - Почта / Пароль два раза
//        Подтвердить почту - Отправить письмо снова / Отменить
//    Сбросить пароль - Почта

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const HomeScreenM(),
        '/account': (context) => const AccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
        //'/person' : (context) => const PersonScreen(),
      },
      initialRoute: '/',
    );
  }
}