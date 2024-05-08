// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OMovieDetailResponse _$OMovieDetailResponseFromJson(
        Map<String, dynamic> json) =>
    OMovieDetailResponse(
      data: json['data'] == null
          ? null
          : OMovieDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OMovieDetailResponseToJson(
        OMovieDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OMovieDetailData _$OMovieDetailDataFromJson(Map<String, dynamic> json) =>
    OMovieDetailData(
      item: json['item'] == null
          ? null
          : OMovieDetail.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OMovieDetailDataToJson(OMovieDetailData instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

OMovieDetail _$OMovieDetailFromJson(Map<String, dynamic> json) => OMovieDetail(
      name: json['name'] as String?,
      content: json['content'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episodes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OMovieDetailToJson(OMovieDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'content': instance.content,
      'episodes': instance.episodes,
    };

Episodes _$EpisodesFromJson(Map<String, dynamic> json) => Episodes(
      serverName: json['server_name'] as String?,
      serverData: (json['server_data'] as List<dynamic>?)
          ?.map((e) => ServerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodesToJson(Episodes instance) => <String, dynamic>{
      'server_name': instance.serverName,
      'server_data': instance.serverData,
    };

ServerData _$ServerDataFromJson(Map<String, dynamic> json) => ServerData(
      name: json['name'] as String?,
      linkM3u8: json['link_m3u8'] as String?,
    );

Map<String, dynamic> _$ServerDataToJson(ServerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'link_m3u8': instance.linkM3u8,
    };
