import 'package:flutter/material.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';

import '../screen/detail.dart';
import '../screen/favorite.dart';
import '../screen/history.dart';
import '../screen/home.dart';

class RouteGenerator {
  static const String detail = '/detail';
  static const String history = '/history';
  static const String favorite = '/favorite';

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case detail:
        return MaterialPageRoute(
            builder: (_) => DetailScreen(movie: args as Movie));

      case history:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());

      case favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
