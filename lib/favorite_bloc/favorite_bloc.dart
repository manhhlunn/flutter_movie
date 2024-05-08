import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';
import 'package:get_it/get_it.dart';

import '../dao/favorite_dao.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    final favoriteDao = GetIt.instance<FavoriteDao>();
    final favoriteStream = favoriteDao.findAll();
    favoriteStream.listen((favorite) {
      add(FavoriteChange(items: favorite.reversed.toList()));
    });
    on<FavoriteChange>((event, emit) async {
      emit(state.copyWith(isLoading: false, items: event.items));
    });
  }
}
