import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/o_movie.dart';
import '../network/network_request.dart';
import '../network/network_util.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class OMovieBloc extends Bloc<MovieEvent, OPhimMovieState> {
  OMovieBloc()
      : super(OPhimMovieState(
            pageType: PageType.news.jsonName,
            category: CategoryItem.values.first.param,
            country: CountryItem.values.first.param,
            pageTypes: {for (var v in PageType.values) v.jsonName: v.name},
            categories: {for (var v in CategoryItem.values) v.param: v.name},
            countries: {for (var v in CountryItem.values) v.param: v.name})) {
    on<MovieFetchEvent>((event, emit) async {
      emit(state.copyWith(
          status: (event.page == 1)
              ? MovieStateStatus.loading
              : MovieStateStatus.loadingMore,
          page: event.page));
      await handleEvent(emit, state);
    });

    on<FilterEvent>((event, emit) async {
      switch (event.filter) {
        case Filters.keyword:
          emit(state.copyWith(
              status: MovieStateStatus.loading, keyword: event.value, page: 1));
          break;
        case Filters.category:
          emit(state.copyWith(
              status: MovieStateStatus.loading,
              category: event.value,
              page: 1));
          break;
        case Filters.country:
          emit(state.copyWith(
              status: MovieStateStatus.loading, country: event.value, page: 1));
          break;

        case Filters.pageType:
          emit(state.copyWith(
              status: MovieStateStatus.loading,
              pageType: event.value,
              keyword: "",
              page: 1));
          break;
      }
      await handleEvent(emit, state);
    });
  }

  Future<void> handleEvent(Emitter<OPhimMovieState> emit, OPhimMovieState state) async {
    try {
      OMovieResponse response;
      if (state.keyword.isNotEmpty) {
        response = await NetworkRequest.searchList(state.keyword, state.page,
            state.category, state.country, state.keyword);
      } else {
        response = await NetworkRequest.fetchList(
            state.pageType, state.page, state.category, state.country);
      }
      final totalItems = response.data?.params?.pagination?.totalItems ?? 0;
      final totalItemsPerPage =
          response.data?.params?.pagination?.totalItemsPerPage ?? 0;
      final maxPage = totalItems ~/ totalItemsPerPage;
      final isLastPage = state.page >= maxPage;
      var items = response.data?.items?.map((e) => e.copyWith(thumbUrl: "${response.data?.image}/uploads/movies/${e.thumbUrl}")).toList() ?? [];
      if (state.page == 1) {
        emit(state.copyWith(
          status: MovieStateStatus.success,
          items: items,
          isLastPage: isLastPage,
        ));
      } else {
        emit(state.copyWith(
          status: MovieStateStatus.success,
          items: [...state.items, ...items],
          isLastPage: isLastPage,
        ));
      }
    } on Exception catch (error) {
      emit(state.copyWith(status: MovieStateStatus.failure, failure: error));
    }
    return;
  }
}
