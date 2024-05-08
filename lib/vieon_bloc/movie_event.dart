part of 'vieon_movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMoreMenuItems extends MovieEvent {
  final int page;

  const GetMoreMenuItems({required this.page});

  @override
  List<Object> get props => [page];
}

class ChangeMenuEvent extends MovieEvent {
  final String value;

  const ChangeMenuEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class SearchEvent extends MovieEvent {
  final String keyword;

  const SearchEvent({required this.keyword});

  @override
  List<Object> get props => [keyword];

}


