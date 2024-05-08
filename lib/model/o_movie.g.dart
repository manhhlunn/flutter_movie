// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OMovieResponse _$OMovieResponseFromJson(Map<String, dynamic> json) =>
    OMovieResponse(
      data: json['data'] == null
          ? null
          : PageData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OMovieResponseToJson(OMovieResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PageData _$PageDataFromJson(Map<String, dynamic> json) => PageData(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      params: json['params'] == null
          ? null
          : Params.fromJson(json['params'] as Map<String, dynamic>),
      image: json['APP_DOMAIN_CDN_IMAGE'] as String?,
    );

Map<String, dynamic> _$PageDataToJson(PageData instance) => <String, dynamic>{
      'items': instance.items,
      'params': instance.params,
      'APP_DOMAIN_CDN_IMAGE': instance.image,
    };

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'pagination': instance.pagination,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
      totalItemsPerPage: (json['totalItemsPerPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalItems': instance.totalItems,
      'totalItemsPerPage': instance.totalItemsPerPage,
    };

OMovie _$OMovieFromJson(Map<String, dynamic> json) => OMovie(
      name: json['name'] as String?,
      thumbUrl: json['thumb_url'] as String?,
      quality: json['quality'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$OMovieToJson(OMovie instance) => <String, dynamic>{
      'name': instance.name,
      'thumb_url': instance.thumbUrl,
      'quality': instance.quality,
      'slug': instance.slug,
    };
