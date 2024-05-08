import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../converter/home_page_converter.dart';
import '../converter/movie_converter.dart';
import '../dao/favorite_dao.dart';
import '../dao/history_dao.dart';
import '../entity/app_movie.dart';
import '../entity/history_entity.dart';

part 'app_database.g.dart';

@TypeConverters([HomePageConverter, MovieConverter])
@Database(version: 1, entities: [Movie, History])
abstract class AppDatabase extends FloorDatabase {
  FavoriteDao get favoriteDao;
  HistoryDao get historyDao;
}
