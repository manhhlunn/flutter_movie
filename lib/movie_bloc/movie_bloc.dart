
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_bloc.freezed.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  MovieBloc() : super(const MovieState()) {
    on<ItemLoadStarted>(
      _onLoadStarted
    );
    on<ItemLoadMoreStarted>(
      _onLoadMoreStarted
    );
  }

  void _onLoadStarted(ItemLoadStarted event, Emitter<MovieState> emit) async {
    try {
      emit(state.copyWith(
        status: ItemStateStatus.loading,
      ));

      final items = await NetworkRequest.fetchList(page: 1, limit: itemsPerPage);

      final canLoadMore = items.length >= itemsPerPage;

      emit(state.copyWith(
        status: ItemStateStatus.success,
        items: items,
        page: 1,
        canLoadMore: canLoadMore,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ItemStateStatus.failure,
        error: e,
      ));
    }
  }
}
