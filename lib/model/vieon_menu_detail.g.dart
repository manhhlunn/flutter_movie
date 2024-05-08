// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vieon_menu_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VieOnMenuDetails _$VieOnMenuDetailsFromJson(Map<String, dynamic> json) =>
    VieOnMenuDetails(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => VieOnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : VieOnMetaData.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VieOnMenuDetailsToJson(VieOnMenuDetails instance) =>
    <String, dynamic>{
      'items': instance.items,
      'metadata': instance.metadata,
    };

VieOnItem _$VieOnItemFromJson(Map<String, dynamic> json) => VieOnItem(
      id: json['id'] as String?,
      title: json['title'] as String?,
      images: json['images'] == null
          ? null
          : VieOnImage.fromJson(json['images'] as Map<String, dynamic>),
      isPremium: (json['is_premium'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VieOnItemToJson(VieOnItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'is_premium': instance.isPremium,
    };

VieOnImage _$VieOnImageFromJson(Map<String, dynamic> json) => VieOnImage(
      poster: json['poster_v4'] as String?,
    );

Map<String, dynamic> _$VieOnImageToJson(VieOnImage instance) =>
    <String, dynamic>{
      'poster_v4': instance.poster,
    };

VieOnMetaData _$VieOnMetaDataFromJson(Map<String, dynamic> json) =>
    VieOnMetaData(
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VieOnMetaDataToJson(VieOnMetaData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
    };
