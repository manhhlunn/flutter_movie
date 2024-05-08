import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../history_bloc/history_bloc.dart';
import '../widget/history.dart';

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
            appBar: AppBar(
              title: const Text('History'),
            ),
            body: makeBody(state));
      }),
    );
  }

  Widget makeBody(HistoryState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return _contentListView(state);
    }
  }

  Widget _contentListView(HistoryState state) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
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
