import 'package:floor/floor.dart';

@entity
class Favorite {
  @primaryKey
  final String id;
  final String name;
  final String image;
  final String quality;
  final int updateTime;

  Favorite(this.id, this.name, this.image, this.quality, this.updateTime);

  Favorite copyWith({
    String? name,
    String? image,
    String? quality
  }) {
    return Favorite(
        id,
        name ?? this.name,
        image ?? this.image,
        quality ?? this.quality,
        DateTime.now().millisecondsSinceEpoch);
  }
}
