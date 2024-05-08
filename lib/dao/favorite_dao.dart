import 'package:floor/floor.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM Movie')
  Stream<List<Movie>> findAll();

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<Movie?> findById(String id);

  @insert
  Future<void> insertFavorite(Movie favorite);

  @Query('DELETE FROM Movie WHERE id = :id')
  Future<void> deleteFavorite(String id);
}
