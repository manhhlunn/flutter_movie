import 'package:floor/floor.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';


@entity
class History {
  @primaryKey
  final String id;
  final Movie movie;
  final int serverIndex;
  final int episodeIndex;
  final int position;

  History(this.id, this.movie, this.serverIndex, this.episodeIndex, this.position);

  History copyWith({
    int? serverIndex,
    int? episodeIndex,
    int? position,
  }) {
    return History(
        id,
        movie,
        serverIndex ?? this.serverIndex,
        episodeIndex ?? this.episodeIndex,
        position ?? this.position);
  }
}
