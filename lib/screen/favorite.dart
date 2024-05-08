import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/widget/movie.dart';

import '../favorite_bloc/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    _favoriteBloc = FavoriteBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _favoriteBloc,
      child:
          BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Favorite'),
            ),
            body: makeBody(state));
      }),
    );
  }

  Widget makeBody(FavoriteState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return _contentListView(state);
    }
  }

  Widget _contentListView(FavoriteState state) {
    return GridView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        itemCount: state.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          childAspectRatio: 0.54,
        ),
        itemBuilder: (context, index) {
          return MovieItem(
            movie: state.items[index],
          );
        });
  }
}
