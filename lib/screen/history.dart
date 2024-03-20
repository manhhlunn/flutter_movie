import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/history_bloc/history_bloc.dart';
import 'package:flutter_movie/widget/history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late HistoryBloc _historyBloc;

  @override
  void initState() {
    _historyBloc = HistoryBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _historyBloc,
      child: BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
        return Scaffold(
            body: makeBody(state, MediaQuery.of(context).viewPadding.top));
      }),
    );
  }

  Widget makeBody(HistoryState state, double top) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return _contentListView(state, top);
    }
  }

  Widget _contentListView(HistoryState state, double top) {
    return ListView.builder(
        padding: EdgeInsets.only(left: 12, right: 12, top: top, bottom: 12),
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 12),
            child: MovieHistoryItem(
              history: state.items[index],
            ),
          );
        });
  }
}
