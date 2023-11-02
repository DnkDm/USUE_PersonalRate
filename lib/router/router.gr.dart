// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogPage(),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsScreen(),
      );
    },
    PersonRoute.name: (routeData) {
      final args = routeData.argsAs<PersonRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonScreen(
          key: args.key,
          email: args.email,
          img: args.img,
          name: args.name,
          rait: args.rait,
        ),
      );
    },
    RatingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RatingScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogPage]
class LogRoute extends PageRouteInfo<void> {
  const LogRoute({List<PageRouteInfo>? children})
      : super(
          LogRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonScreen]
class PersonRoute extends PageRouteInfo<PersonRouteArgs> {
  PersonRoute({
    Key? key,
    required String email,
    required String img,
    required String name,
    required String rait,
    List<PageRouteInfo>? children,
  }) : super(
          PersonRoute.name,
          args: PersonRouteArgs(
            key: key,
            email: email,
            img: img,
            name: name,
            rait: rait,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonRoute';

  static const PageInfo<PersonRouteArgs> page = PageInfo<PersonRouteArgs>(name);
}

class PersonRouteArgs {
  const PersonRouteArgs({
    this.key,
    required this.email,
    required this.img,
    required this.name,
    required this.rait,
  });

  final Key? key;

  final String email;

  final String img;

  final String name;

  final String rait;

  @override
  String toString() {
    return 'PersonRouteArgs{key: $key, email: $email, img: $img, name: $name, rait: $rait}';
  }
}

/// generated route for
/// [RatingScreen]
class RatingRoute extends PageRouteInfo<void> {
  const RatingRoute({List<PageRouteInfo>? children})
      : super(
          RatingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
