import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/dao/history_dao.dart';
import 'package:flutter_movie/database/app_database.dart';
import 'package:flutter_movie/model/movie_detail.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:get_it/get_it.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(const MovieDetailState()) {
    on<GetDetailEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final historyDao = GetIt.instance<HistoryDao>();
      final history = await historyDao.findById(event.slug);
      try {
        final movie = await NetworkRequest.fetchData(event.slug);
        if (history != null) {
          final episodes = movie.data?.item?.episodes;
          Episodes? historyEpisodes = episodes?.firstOrNull;
          if (episodes != null &&
              episodes.isNotEmpty &&
              history.serverIndex <= episodes.length - 1) {
            historyEpisodes = episodes[history.serverIndex];
          }
          emit(state.copyWith(
              detail: movie,
              currentEpisodes: historyEpisodes,
              currentEpisodeIdx: history.episodeIndex,
              startPosition: history.position,
              isLoading: false));
        } else {
          emit(state.copyWith(
              detail: movie,
              currentEpisodes: movie.data?.item?.episodes?.firstOrNull,
              isLoading: false));
        }
      } on Exception catch (error) {
        emit(state.copyWith(failure: error, isLoading: false));
      }
    });

    on<NextEpisodeEvent>((event, emit) async {
      Episodes? data = state.currentEpisodes;
      int? maxSize = data?.serverData?.length;
      if (maxSize != null &&
          data != null &&
          state.currentEpisodeIdx < maxSize - 1) {
        emit(state.copyWith(currentEpisodeIdx: state.currentEpisodeIdx + 1));
      }
    });

    on<ChangeEpisodeEvent>((event, emit) async {
      emit(state.copyWith(
          currentEpisodes: event.episodes, currentEpisodeIdx: event.index));
    });
  }
}
