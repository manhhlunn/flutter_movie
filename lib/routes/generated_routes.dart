import 'package:flutter/material.dart';
import 'package:flutter_movie/detail_bloc/movie_detail_bloc.dart';
import 'package:flutter_movie/page_bloc/page_bloc.dart';
import 'package:flutter_movie/screen/detail.dart';
import 'package:flutter_movie/screen/favorite.dart';
import 'package:flutter_movie/screen/history.dart';
import 'package:flutter_movie/screen/home.dart';

class RouteGenerator {
  final PageBloc pageBloc = PageBloc();
  final MovieDetailBloc movieDetailBloc = MovieDetailBloc();
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
            builder: (_) => DetailScreen(slug: args as String));

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
