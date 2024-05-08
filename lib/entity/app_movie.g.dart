// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      content: json['content'] as String?,
      homePage: $enumDecode(_$HomePageEnumMap, json['homePage']),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'content': instance.content,
      'homePage': _$HomePageEnumMap[instance.homePage]!,
    };

const _$HomePageEnumMap = {
  HomePage.ophim: 'ophim',
  HomePage.vieon: 'vieon',
};
