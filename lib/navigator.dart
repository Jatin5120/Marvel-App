import 'package:flutter/material.dart';
import 'package:marvel_app/screens/screens.dart';
import 'constants/constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic agrs = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/dashboard':
        if (agrs is String) {
          switch (agrs) {
            case TypeConstant.characters:
              return MaterialPageRoute(
                builder: (_) => CharacterScreen(
                  type: agrs,
                ),
              );
            case TypeConstant.comics:
              return MaterialPageRoute(
                builder: (_) => ComicScreen(
                  type: agrs,
                ),
              );
            case TypeConstant.creators:
              return MaterialPageRoute(
                builder: (_) => CreatorScreen(
                  type: agrs,
                ),
              );
            case TypeConstant.events:
              return MaterialPageRoute(
                builder: (_) => EventScreen(
                  type: agrs,
                ),
              );
            case TypeConstant.series:
              return MaterialPageRoute(
                builder: (_) => SeriesScreen(
                  type: agrs,
                ),
              );
            case TypeConstant.stories:
              return MaterialPageRoute(
                builder: (_) => StoriesScreen(
                  type: agrs,
                ),
              );
            default:
              return MaterialPageRoute(builder: (_) => HomeScreen());
          }
        }
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}

class MyRoutes {
  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String settings = '/settings';
}
