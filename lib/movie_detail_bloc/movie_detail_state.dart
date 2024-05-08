part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final bool isLoading;
  final Movie? movie;
  final MovieDetail? detail;
  final List<MovieLink>? servers;
  final List<MovieEpisode>? episodes;
  final int currentServerIdx;
  final int currentEpisodeIdx;
  final int startPosition;
  final bool isFavorite;
  final ChewieController? controller;
  final VideoPlayerController? videoPlayerController;
  final Exception? failure;

  const MovieDetailState(
      {this.isLoading = false,
      this.movie,
      this.detail,
      this.servers,
      this.episodes,
      this.currentServerIdx = 0,
      this.currentEpisodeIdx = 0,
      this.startPosition = 0,
      this.isFavorite = false,
      this.controller,
      this.videoPlayerController,
      this.failure});

  @override
  List<Object?> get props => [
        isLoading,
        movie,
        detail,
        servers,
        episodes,
        currentServerIdx,
        currentEpisodeIdx,
        startPosition,
        isFavorite,
        controller,
        videoPlayerController,
        failure
      ];

  MovieDetailState copyWith(
      {bool? isLoading,
      Movie? movie,
      MovieDetail? detail,
      List<MovieLink>? servers,
      List<MovieEpisode>? episodes,
      int? currentServerIdx,
      int? currentEpisodeIdx,
      int? startPosition,
      bool? isFavorite,
      ChewieController? controller,
      VideoPlayerController? videoPlayerController,
      Exception? failure}) {
    return MovieDetailState(
        isLoading: isLoading ?? this.isLoading,
        movie: movie ?? this.movie,
        detail: detail ?? this.detail,
        servers: servers ?? this.servers,
        episodes: episodes ?? this.episodes,
        currentServerIdx: currentServerIdx ?? this.currentServerIdx,
        currentEpisodeIdx: currentEpisodeIdx ?? this.currentEpisodeIdx,
        startPosition: startPosition ?? this.startPosition,
        isFavorite: isFavorite ?? this.isFavorite,
        controller: controller ?? this.controller,
        videoPlayerController:
            videoPlayerController ?? this.videoPlayerController,
        failure: failure ?? this.failure);
  }
}
