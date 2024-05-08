import 'package:flutter/material.dart';
import 'package:flutter_movie_app/db/app_database.dart';
import 'package:flutter_movie_app/routes/generated_routes.dart';
import 'package:get_it/get_it.dart';

import 'dao/favorite_dao.dart';
import 'dao/history_dao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt serviceLocator = GetIt.instance;
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  serviceLocator.registerSingleton<HistoryDao>(database.historyDao);
  serviceLocator.registerSingleton<FavoriteDao>(database.favoriteDao);
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
