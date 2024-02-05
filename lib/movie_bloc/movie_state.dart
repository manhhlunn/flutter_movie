part of 'movie_bloc.dart';

enum ItemStateStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(ItemStateStatus.initial) ItemStateStatus status,
    @Default([]) List<Movie> items,
    @Default(0) int selectedItemIndex,
    @Default(1) int page,
    @Default(true) bool canLoadMore,
    Exception? error,
  }) = _MovieState;
}
