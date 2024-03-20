import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/dao/history_dao.dart';
import 'package:flutter_movie/entity/history_entity.dart';
import 'package:get_it/get_it.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState()) {
    final historyDao = GetIt.instance<HistoryDao>();
    final historyStream = historyDao.findAll();
    historyStream.listen((history) {
      add(HistoryChange(items: history));
    });
    on<HistoryChange>((event, emit) async {
      emit(state.copyWith(isLoading: false, items: event.items));
    });
  }
}
