part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetDetailEvent extends MovieDetailEvent {
  final Movie movie;

  const GetDetailEvent({required this.movie});

  @override
  List<Object> get props => [movie];
}


class ChangeEpisodeEvent extends MovieDetailEvent {
  final int index;

  const ChangeEpisodeEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class ChangeServerEvent extends MovieDetailEvent {
  final int index;

  const ChangeServerEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class FavoriteChangeEvent extends MovieDetailEvent {
  final bool isFavorite;

  const FavoriteChangeEvent({required this.isFavorite});

  @override
  List<Object> get props => [isFavorite];
}
