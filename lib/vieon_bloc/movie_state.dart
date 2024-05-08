part of 'vieon_movie_bloc.dart';

class VieOnMovieState extends Equatable {
  final String keyword;
  final String? menu;
  final Map<String, String>? menuItems;
  final MovieStateStatus status;
  final List<VieOnItem> items;
  final int page;
  final bool isLastPage;
  final Exception? failure;

  const VieOnMovieState(
      {this.keyword = "",
      this.menu,
      this.menuItems,
      this.status = MovieStateStatus.initial,
      this.items = const [],
      this.page = 1,
      this.isLastPage = false,
      this.failure});

  @override
  List<Object?> get props =>
      [keyword, menu, menuItems, status, items, page, isLastPage, failure];

  VieOnMovieState copyWith(
      {String? keyword,
      String? menu,
      Map<String, String>? menuItems,
      MovieStateStatus? status,
      List<VieOnItem>? items,
      int? page,
      bool? isLastPage,
      Exception? failure}) {
    return VieOnMovieState(
        keyword: keyword ?? this.keyword,
        menu: menu ?? this.menu,
        menuItems: menuItems ?? this.menuItems,
        status: status ?? this.status,
        items: items ?? this.items,
        page: page ?? this.page,
        isLastPage: isLastPage ?? this.isLastPage,
        failure: failure ?? this.failure);
  }
}
