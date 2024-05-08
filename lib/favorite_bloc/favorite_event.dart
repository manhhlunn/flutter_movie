part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteChange extends FavoriteEvent {

  final List<Movie> items;

  const FavoriteChange({required this.items});

  @override
  List<Object?> get props => [items];
}