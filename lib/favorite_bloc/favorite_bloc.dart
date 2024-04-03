import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/dao/favorite_dao.dart';
import 'package:flutter_movie/entity/favorite_entity.dart';
import 'package:get_it/get_it.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    final favoriteDao = GetIt.instance<FavoriteDao>();
    final favoriteStream = favoriteDao.findAll();
    favoriteStream.listen((favorite) {
      add(FavoriteChange(items: favorite));
    });
    on<FavoriteChange>((event, emit) async {
      emit(state.copyWith(isLoading: false, items: event.items));
    });
  }
}
