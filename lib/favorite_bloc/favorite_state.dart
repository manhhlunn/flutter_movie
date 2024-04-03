part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final bool isLoading;
  final List<Favorite> items;

  const FavoriteState(
      {this.isLoading = true, this.items = const []});

  @override
  List<Object?> get props => [isLoading, items];

  FavoriteState copyWith(
      {bool? isLoading, List<Favorite>? items}) {
    return FavoriteState(
        isLoading: isLoading ?? this.isLoading,
        items: items ?? this.items);
  }
}
