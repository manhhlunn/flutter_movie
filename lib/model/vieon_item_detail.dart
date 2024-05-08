import 'package:flutter_movie_app/model/vieon_menu_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vieon_item_detail.g.dart';

@JsonSerializable()
class VieOnItemDetails {
  final String? id;
  final String? title;
  @JsonKey(name: 'long_description')
  final String? description;
  final int? episode;

  VieOnItemDetails({this.id, this.title, this.description, this.episode});

  factory VieOnItemDetails.fromJson(Map<String, dynamic> json) => _$VieOnItemDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnItemDetailsToJson(this);
}

@JsonSerializable()
class VieOnEpisode {
  final List<VieOnEpisodeItem>? items;
  final VieOnMetaData? metadata;

  VieOnEpisode({this.items, this.metadata});

  factory VieOnEpisode.fromJson(Map<String, dynamic> json) => _$VieOnEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnEpisodeToJson(this);
}

@JsonSerializable()
class VieOnEpisodeItem {
  final String? id;
  final String? title;
  @JsonKey(name: 'is_premium')
  final int? isPremium;

  VieOnEpisodeItem({this.id, this.title, this.isPremium});

  factory VieOnEpisodeItem.fromJson(Map<String, dynamic> json) => _$VieOnEpisodeItemFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnEpisodeItemToJson(this);
}