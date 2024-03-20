part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class HistoryChange extends HistoryEvent {

  final List<History> items;

  const HistoryChange({required this.items});

  @override
  List<Object?> get props => [items];
}