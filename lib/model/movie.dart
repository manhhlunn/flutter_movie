class MovieResponse {
  final PageProps? props;

  const MovieResponse({required this.props});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'pageProps': Map<String, dynamic> json,
      } =>
        MovieResponse(props: PageProps.fromJson(json)),
      _ => throw const FormatException('Failed to load MovieResponse.'),
    };
  }
}

class PageProps {
  final PageData? data;

  const PageProps({required this.data});

  factory PageProps.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'data': Map<String, dynamic> json,
      } =>
        PageProps(data: PageData.fromJson(json)),
      _ => throw const FormatException('Failed to load PageProps.'),
    };
  }
}

class PageData {
  final List<Movie>? items;
  final Params? params;

  const PageData({required this.items, required this.params});

  factory PageData.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'items': Iterable jsonItems,
        'params': Map<String, dynamic> jsonParams,
      } =>
        PageData(
            items: List<Movie>.from(
                jsonItems.map((model) => Movie.fromJson(model))),
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

class Movie {
  final String? id;
  final String? name;
  final String? originName;
  final String? type;
  final String? thumbUrl;
  final String? posterUrl;
  final String? time;
  final String? episodeCurrent;
  final String? quality;
  final String? lang;
  final String? slug;
  final int? year;

  const Movie(
      {required this.id,
      required this.name,
      required this.originName,
      required this.type,
      required this.thumbUrl,
      required this.posterUrl,
      required this.time,
      required this.episodeCurrent,
      required this.quality,
      required this.lang,
      required this.slug,
      required this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String? id,
        'name': String? name,
        'slug': String? slug,
        'origin_name': String? originName,
        'type': String? type,
        'thumb_url': String? thumbUrl,
        'poster_url': String? posterUrl,
        'time': String? time,
        'episode_current': String? episodeCurrent,
        'quality': String? quality,
        'lang': String? lang,
        'year': int? year
      } =>
        Movie(
            id: id,
            name: name,
            originName: originName,
            type: type,
            thumbUrl: thumbUrl,
            posterUrl: posterUrl,
            time: time,
            episodeCurrent: episodeCurrent,
            quality: quality,
            lang: lang,
            slug: slug,
            year: year),
      _ => throw const FormatException('Failed to load Movie.'),
    };
  }
}
