import 'package:floor/floor.dart';
import 'package:flutter_movie/entity/history_entity.dart';

@dao
abstract class HistoryDao {
  @Query('SELECT * FROM History ORDER BY updateTime DESC')
  Stream<List<History>> findAll();

  @Query('SELECT * FROM History WHERE id = :id')
  Future<History?> findById(String id);

  @insert
  Future<void> insertHistory(History history);

  @update
  Future<void> updateHistory(History history);

  @delete
  Future<void> deleteHistory(History history);
}