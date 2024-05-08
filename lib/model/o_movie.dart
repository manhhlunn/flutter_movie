

import 'package:json_annotation/json_annotation.dart';

part 'o_movie.g.dart';

@JsonSerializable()
class OMovieResponse {
  final PageData? data;

  const OMovieResponse({required this.data});

  factory OMovieResponse.fromJson(Map<String, dynamic> json) => _$OMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OMovieResponseToJson(this);
}

@JsonSerializable()
class PageData {
  final List<OMovie>? items;
  final Params? params;
  @JsonKey(name: 'APP_DOMAIN_CDN_IMAGE') final String? image;

  const PageData({required this.items, required this.params, required this.image});

  factory PageData.fromJson(Map<String, dynamic> json) => _$PageDataFromJson(json);
  Map<String, dynamic> toJson() => _$PageDataToJson(this);
}

@JsonSerializable()
class Params {
  final Pagination? pagination;

  const Params({required this.pagination});

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}

@JsonSerializable()
class Pagination {
  final int? currentPage;
  final int? totalItems;
  final int? totalItemsPerPage;

  const Pagination(
      {required this.currentPage,
      required this.totalItems,
      required this.totalItemsPerPage});

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class OMovie {
  final String? name;
  @JsonKey(name: 'thumb_url')final String? thumbUrl;
  final String? quality;
  final String? slug;

  const OMovie(
      {required this.name,
      required this.thumbUrl,
      required this.quality,
      required this.slug});

  factory OMovie.fromJson(Map<String, dynamic> json) => _$OMovieFromJson(json);
  Map<String, dynamic> toJson() => _$OMovieToJson(this);

  OMovie copyWith({String? name, String? thumbUrl, String? quality, String? slug}) {
    return OMovie(
      name: name ?? this.name,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      quality: quality ?? this.quality,
      slug: slug ?? this.slug
    );
  }

}
