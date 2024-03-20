import 'package:equatable/equatable.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

enum Filters {
  keyword,
  category,
  country
}

class MovieFetchEvent extends MovieEvent {
  final int page;

  const MovieFetchEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class FilterEvent extends MovieEvent {
  final Filters filter;
  final String value;

  const FilterEvent({required this.filter, required this.value});

  @override
  List<Object> get props => [filter, value];
}




