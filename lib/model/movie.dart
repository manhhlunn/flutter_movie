import 'package:flutter_movie/network/network_request.dart';

class MovieResponse {
  final PageData? data;

  const MovieResponse({required this.data});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'data': Map<String, dynamic> json,
      } =>
        MovieResponse(data: PageData.fromJson(json)),
      _ => throw const FormatException('Failed to load MovieResponse.'),
    };
  }
}

class PageData {
  final List<PreviewMovie>? items;
  final Params? params;

  const PageData({required this.items, required this.params});

  factory PageData.fromJson(Map<String, dynamic> json) {
    NetworkRequest.imageDomain = json['APP_DOMAIN_CDN_IMAGE'] +"/uploads/movies/";
    return switch (json) {
      {
        'items': Iterable jsonItems,
        'params': Map<String, dynamic> jsonParams
      } =>
        PageData(
            items: List<PreviewMovie>.from(
                jsonItems.map((model) => PreviewMovie.fromJson(model))),
            params: Params.fromJson(jsonParams)),
      _ => throw const FormatException('Failed to load PageData.'),
    };
  }
}

class Params {
  final Pagination? pagination;

  const Params({required this.pagination});

  factory Params.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'pagination': Map<String, dynamic> json,
      } =>
        Params(
          pagination: Pagination.fromJson(json),
        ),
      _ => throw const FormatException('Failed to load Params.'),
    };
  }
}

class Pagination {
  final int? currentPage;
  final int? totalItems;
  final int? totalItemsPerPage;

  const Pagination(
      {required this.currentPage,
      required this.totalItems,
      required this.totalItemsPerPage});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'totalItems': int? totalItems,
        'totalItemsPerPage': int? totalItemsPerPage,
        'currentPage': int? currentPage,
      } =>
        Pagination(
          totalItems: totalItems,
          totalItemsPerPage: totalItemsPerPage,
          currentPage: currentPage,
        ),
      _ => throw const FormatException('Failed to load Pagination.'),
    };
  }
}

class PreviewMovie {
  final String? id;
  final String? name;
  final String? thumbUrl;
  final String? quality;
  final String? slug;

  const PreviewMovie(
      {required this.id,
      required this.name,
      required this.thumbUrl,
      required this.quality,
      required this.slug});

  factory PreviewMovie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String? id,
        'name': String? name,
        'thumb_url': String? thumbUrl,
        'quality': String? quality,
        'slug': String? slug
      } =>
        PreviewMovie(
            id: id,
            name: name,
            thumbUrl: thumbUrl,
            quality: quality,
            slug: slug),
      _ => throw const FormatException('Failed to load Movie.'),
    };
  }
}
