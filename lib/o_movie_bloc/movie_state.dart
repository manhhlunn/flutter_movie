part of 'o_movie_bloc.dart';

enum MovieStateStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

class OPhimMovieState extends Equatable {
  final String keyword;
  final String pageType;
  final String category;
  final String country;
  final Map<String, String> pageTypes;
  final Map<String, String> categories;
  final Map<String, String> countries;
  final MovieStateStatus status;
  final List<OMovie> items;
  final int page;
  final bool isLastPage;
  final Exception? failure;

  const OPhimMovieState(
      {required this.pageType,
      this.keyword = "",
      required this.category,
      required this.country,
      required this.pageTypes,
      required this.categories,
      required this.countries,
      this.status = MovieStateStatus.initial,
      this.items = const [],
      this.page = 1,
      this.isLastPage = false,
      this.failure});

  @override
  List<Object?> get props => [
        pageType,
        keyword,
        category,
        country,
        pageTypes,
        categories,
        countries,
        status,
        items,
        page,
        isLastPage,
        failure
      ];

  OPhimMovieState copyWith(
      {String? keyword,
      String? pageType,
      String? category,
      String? country,
      Map<String, String>? pageTypes,
      Map<String, String>? categories,
      Map<String, String>? countries,
      MovieStateStatus? status,
      List<OMovie>? items,
      int? page,
      bool? isLastPage,
      Exception? failure}) {
    return OPhimMovieState(
        keyword: keyword ?? this.keyword,
        pageType: pageType ?? this.pageType,
        category: category ?? this.category,
        country: country ?? this.country,
        pageTypes: pageTypes ?? this.pageTypes,
        categories: categories ?? this.categories,
        countries: countries ?? this.countries,
        status: status ?? this.status,
        items: items ?? this.items,
        page: page ?? this.page,
        isLastPage: isLastPage ?? this.isLastPage,
        failure: failure ?? this.failure);
  }
}
