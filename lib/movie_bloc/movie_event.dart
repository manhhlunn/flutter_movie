part of 'movie_bloc.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.loadStarted(
      {required PageType pageType,
      required String genre,
      required String country,
      required String keyword}) = ItemLoadStarted;

  const factory MovieEvent.loadMoreStarted({required PageType pageType}) =
      ItemLoadMoreStarted;

  const factory MovieEvent.selectChanged({required String slug}) =
      ItemSelectChanged;
}
