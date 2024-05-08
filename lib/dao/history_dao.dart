import 'package:floor/floor.dart';
import '../entity/history_entity.dart';

@dao
abstract class HistoryDao {
  @Query('SELECT * FROM History')
  Stream<List<History>> findAll();

  @Query('SELECT * FROM History WHERE id = :id')
  Future<History?> findById(String id);

  @insert
  Future<void> insertHistory(History history);

  @delete
  Future<void> deleteHistory(History history);
}