import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/movie_bloc/movie_event.dart';
import 'package:flutter_movie/movie_bloc/movie_state.dart';
import 'package:flutter_movie/network/network_request.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final PageType pageType;

  MovieBloc({required this.pageType})
      : super(MovieState(
            pageType: pageType,
            category: CategoryItem.values.first.param,
            country: CountryItem.values.first.param,
            categories: {for (var v in CategoryItem.values) v.param: v.name},
            countries: {for (var v in CountryItem.values) v.param: v.name})) {
    on<MovieFetchEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            status: (event.page == 1)
                ? MovieStateStatus.loading
                : MovieStateStatus.loadingMore));

        final newItems = await NetworkRequest.fetchList(state.pageType,
            event.page, state.category, state.country, state.keyword);
        final totalItems = newItems.data?.params?.pagination?.totalItems ?? 0;
        final totalItemsPerPage =
            newItems.data?.params?.pagination?.totalItemsPerPage ?? 0;
        final maxPage = totalItems ~/ totalItemsPerPage;
        final isLastPage = event.page >= maxPage;
        var items = newItems.data?.items ?? [];
        if (event.page == 1) {
          emit(state.copyWith(
            status: MovieStateStatus.success,
            items: items,
            page: event.page,
            isLastPage: isLastPage,
          ));
        } else {
          emit(state.copyWith(
            status: MovieStateStatus.success,
            items: [...state.items, ...items],
            page: event.page,
            isLastPage: isLastPage,
          ));
        }
      } on Exception catch (error) {
        emit(state.copyWith(status: MovieStateStatus.failure, failure: error));
      }
    });

    on<FilterEvent>((event, emit) async {
      switch (event.filter) {
        case Filters.keyword:
          emit(state.copyWith(
              status: MovieStateStatus.loading, keyword: event.value));
          break;
        case Filters.category:
          emit(state.copyWith(
              status: MovieStateStatus.loading, category: event.value));
          break;
        case Filters.country:
          emit(state.copyWith(
              status: MovieStateStatus.loading, country: event.value));
          break;
      }

      try {
        final newItems = await NetworkRequest.fetchList(
            state.pageType, 1, state.category, state.country, state.keyword);
        final totalItems = newItems.data?.params?.pagination?.totalItems ?? 0;
        final totalItemsPerPage =
            newItems.data?.params?.pagination?.totalItemsPerPage ?? 0;
        final maxPage = totalItems ~/ totalItemsPerPage;
        final isLastPage = 1 >= maxPage;
        var items = newItems.data?.items ?? [];
        emit(state.copyWith(
          status: MovieStateStatus.success,
          items: items,
          page: 1,
          isLastPage: isLastPage,
        ));
      } on Exception catch (error) {
        emit(state.copyWith(status: MovieStateStatus.failure, failure: error));
      }
    });
  }
}
