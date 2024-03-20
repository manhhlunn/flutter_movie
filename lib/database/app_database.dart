
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_movie/dao/history_dao.dart';
import 'package:flutter_movie/entity/history_entity.dart';
part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [History])
abstract class AppDatabase extends FloorDatabase {
  HistoryDao get historyDao;
}