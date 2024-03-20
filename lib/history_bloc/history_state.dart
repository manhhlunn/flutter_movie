part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final bool isLoading;
  final List<History> items;

  const HistoryState(
      {this.isLoading = true, this.items = const []});

  @override
  List<Object?> get props => [isLoading, items];

  HistoryState copyWith(
      {bool? isLoading, List<History>? items}) {
    return HistoryState(
        isLoading: isLoading ?? this.isLoading,
        items: items ?? this.items);
  }
}
