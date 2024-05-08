import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/model/vieon_menu.dart';
import 'package:flutter_movie_app/model/vieon_menu_detail.dart';

import '../network/network_request.dart';
import '../o_movie_bloc/o_movie_bloc.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class VieOnMovieBloc extends Bloc<MovieEvent, VieOnMovieState> {
  VieOnMovieBloc() : super(const VieOnMovieState()) {
    on<GetMoreMenuItems>((event, emit) async {
      emit(state.copyWith(
          status: (event.page == 1)
              ? MovieStateStatus.loading
              : MovieStateStatus.loadingMore,
          page: event.page));

      if (event.page == 1) {
        var response = await NetworkRequest.fetchMenu();
        var menuItems = response.firstOrNull?.subMenu?.getAllMenu() ?? [];
        var menu = state.menu ?? menuItems.firstOrNull?.id;
        emit(state.copyWith(
            menuItems: {for (var v in menuItems) v.id ?? '': v.name ?? ''},
            menu: menu));
      }

      await handleEvent(emit, state);
    });

    on<ChangeMenuEvent>((event, emit) async {
      emit(state.copyWith(
          status: MovieStateStatus.loading,
          menu: event.value,
          keyword: "",
          page: 1));

      await handleEvent(emit, state);
    });

    on<SearchEvent>((event, emit) async {
      emit(state.copyWith(
          status: MovieStateStatus.loading, keyword: event.keyword, page: 1));
      await handleEvent(emit, state);
    });
  }

  Future<void> handleEvent(
      Emitter<VieOnMovieState> emit, VieOnMovieState state) async {
    try {
      VieOnMenuDetails response;
      if (state.keyword.isNotEmpty) {
        response = await NetworkRequest.searchVieOnItems(
            state.keyword, state.page, 20);
      } else {
        response = await NetworkRequest.fetchMenuDetail(
            state.menu ?? '', state.page, 20);
      }
      var total = response.metadata?.total ?? 0;
      final isLastPage = 20 * state.page >= total;
      var items = response.items ?? [];
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
