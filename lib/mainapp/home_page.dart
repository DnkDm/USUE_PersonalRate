import 'package:animations/animations.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usue_app_rate2/mainapp/for_no_login.dart';
import 'package:usue_app_rate2/mainapp/for_login.dart';
import 'package:usue_app_rate2/router/router.dart';

import 'package:usue_app_rate2/screens/account_screen.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        RatingRoute(),
        NewsRoute(),
        LogRoute(),
      ],
      transitionBuilder: (context, child, animation) => child,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF003543),
            unselectedItemColor: Colors.white,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.data_exploration), label: 'rating'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: 'news'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'acc'),
            ],
          ),
        );
      },

    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}

