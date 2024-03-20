import 'package:equatable/equatable.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:flutter_movie/model/movie_detail.dart';
import 'package:flutter_movie/network/network_request.dart';

enum MovieStateStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

class MovieState extends Equatable {
  final PageType pageType;
  final String keyword;
  final String category;
  final String country;
  final Map<String, String> categories;
  final Map<String, String> countries;
  final MovieStateStatus status;
  final List<PreviewMovie> items;
  final int page;
  final bool isLastPage;
  final Exception? failure;

  const MovieState(
      {required this.pageType,
      this.keyword = "",
      required this.category,
      required this.country,
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
        categories,
        countries,
        status,
        items,
        page,
        isLastPage,
        failure
      ];

  MovieState copyWith(
      {PageType? pageType,
      String? keyword,
      String? category,
      String? country,
      Map<String, String>? categories,
      Map<String, String>? countries,
      MovieStateStatus? status,
      List<PreviewMovie>? items,
      int? page,
      bool? isLastPage,
      MovieDetail? detail,
      Exception? failure}) {
    return MovieState(
        pageType: pageType ?? this.pageType,
        keyword: keyword ?? this.keyword,
        category: category ?? this.category,
        country: country ?? this.country,
        categories: categories ?? this.categories,
        countries: countries ?? this.countries,
        status: status ?? this.status,
        items: items ?? this.items,
        page: page ?? this.page,
        isLastPage: isLastPage ?? this.isLastPage,
        failure: failure ?? this.failure);
  }
}
