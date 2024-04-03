import 'package:floor/floor.dart';
import 'package:flutter_movie/entity/favorite_entity.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM Favorite ORDER BY updateTime DESC')
  Stream<List<Favorite>> findAll();

  @Query('SELECT * FROM Favorite WHERE id = :id')
  Future<Favorite?> findById(String id);

  @insert
  Future<void> insertFavorite(Favorite history);

  @update
  Future<void> updateFavorite(Favorite history);

  @Query('DELETE FROM Favorite WHERE id = :id')
  Future<void> deleteFavorite(String id);
}
