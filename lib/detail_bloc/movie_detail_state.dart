part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final bool isLoading;
  final MovieDetail? detail;
  final Episodes? currentEpisodes;
  final int currentEpisodeIdx;
  final int startPosition;
  final Exception? failure;

  const MovieDetailState(
      {this.isLoading = false,
      this.detail,
      this.currentEpisodes,
      this.currentEpisodeIdx = 0,
      this.startPosition = 0,
      this.failure});

  @override
  List<Object?> get props =>
      [isLoading, detail, currentEpisodes, currentEpisodeIdx, startPosition, failure];

  MovieDetailState copyWith(
      {bool? isLoading,
      MovieDetail? detail,
      Episodes? currentEpisodes,
      int? currentEpisodeIdx,
      int? startPosition,
      Exception? failure}) {
    return MovieDetailState(
        isLoading: isLoading ?? this.isLoading,
        detail: detail ?? this.detail,
        currentEpisodes: currentEpisodes ?? this.currentEpisodes,
        currentEpisodeIdx: currentEpisodeIdx ?? this.currentEpisodeIdx,
        startPosition: startPosition ?? 0,
        failure: failure ?? this.failure);
  }
}
