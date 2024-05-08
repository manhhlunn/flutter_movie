// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vieon_item_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VieOnItemDetails _$VieOnItemDetailsFromJson(Map<String, dynamic> json) =>
    VieOnItemDetails(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['long_description'] as String?,
      episode: (json['episode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VieOnItemDetailsToJson(VieOnItemDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'long_description': instance.description,
      'episode': instance.episode,
    };

VieOnEpisode _$VieOnEpisodeFromJson(Map<String, dynamic> json) => VieOnEpisode(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => VieOnEpisodeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : VieOnMetaData.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VieOnEpisodeToJson(VieOnEpisode instance) =>
    <String, dynamic>{
      'items': instance.items,
      'metadata': instance.metadata,
    };

VieOnEpisodeItem _$VieOnEpisodeItemFromJson(Map<String, dynamic> json) =>
    VieOnEpisodeItem(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isPremium: (json['is_premium'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VieOnEpisodeItemToJson(VieOnEpisodeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_premium': instance.isPremium,
    };
