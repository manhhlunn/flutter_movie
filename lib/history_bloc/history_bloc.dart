import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../dao/history_dao.dart';
import '../entity/history_entity.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState()) {
    final historyDao = GetIt.instance<HistoryDao>();
    final historyStream = historyDao.findAll();
    historyStream.listen((history) {
      add(HistoryChange(items: history.reversed.toList()));
    });
    on<HistoryChange>((event, emit) async {
      emit(state.copyWith(isLoading: false, items: event.items));
    });
  }
}
