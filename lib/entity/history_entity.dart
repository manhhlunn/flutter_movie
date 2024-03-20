import 'package:floor/floor.dart';

@entity
class History {
  @primaryKey
  final String id;
  final String name;
  final String image;
  final int serverIndex;
  final int episodeIndex;
  final int position;
  final int updateTime;

  History(this.id, this.name, this.image, this.serverIndex, this.episodeIndex,
      this.position, this.updateTime);

  History copyWith({
    String? name,
    String? image,
    int? serverIndex,
    int? episodeIndex,
    int? position,
  }) {
    return History(
        id,
        name ?? this.name,
        image ?? this.image,
        serverIndex ?? this.serverIndex,
        episodeIndex ?? this.episodeIndex,
        position ?? this.position,
        DateTime.now().millisecondsSinceEpoch);
  }
}
