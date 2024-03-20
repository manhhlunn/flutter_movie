import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/page_bloc/page_event.dart';
import 'package:flutter_movie/page_bloc/page_state.dart';


class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageState(tabIndex: 0)) {
    on<TabChange>((event, emit) {
      emit(PageState(tabIndex: event.tabIndex));
    });
  }
}
