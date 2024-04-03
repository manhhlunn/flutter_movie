import 'package:flutter/material.dart';
import 'package:flutter_movie/dao/favorite_dao.dart';
import 'package:flutter_movie/dao/history_dao.dart';
import 'package:flutter_movie/database/app_database.dart';
import 'package:flutter_movie/routes/generated_routes.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt serviceLocator = GetIt.instance;
  final appDatabase = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  serviceLocator.registerSingleton<HistoryDao>(appDatabase.historyDao);
  serviceLocator.registerSingleton<FavoriteDao>(appDatabase.favoriteDao);
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
