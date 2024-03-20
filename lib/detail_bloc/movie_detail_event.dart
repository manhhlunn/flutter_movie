part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetDetailEvent extends MovieDetailEvent {
  final String slug;

  const GetDetailEvent({required this.slug});

  @override
  List<Object> get props => [slug];
}

class NextEpisodeEvent extends MovieDetailEvent {
  const NextEpisodeEvent();

  @override
  List<Object> get props => [];
}

class ChangeEpisodeEvent extends MovieDetailEvent {
  final Episodes episodes;
  final int index;

  const ChangeEpisodeEvent({required this.episodes, required this.index});

  @override
  List<Object> get props => [episodes, index];
}
