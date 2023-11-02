import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../mainapp/for_login.dart';
import '../mainapp/news_screen.dart';
import '../mainapp/person_screen.dart';
import '../mainapp/rating_screen.dart';
import '../mainapp/home_page.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', children: [
          AutoRoute(page: RatingRoute.page, path: 'rating'),
          AutoRoute(page: NewsRoute.page, path: 'news'),
          AutoRoute(page: LogRoute.page, path: 'log')
        ]),
        AutoRoute(page: PersonRoute.page, path: '/person'),

        //AutoRoute(page: HomeRouteM.page, path: '/homeP')
      ];
}
