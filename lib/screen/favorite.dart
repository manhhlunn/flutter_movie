import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/favorite_bloc/favorite_bloc.dart';
import 'package:flutter_movie/widget/movie.dart';

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
            body: makeBody(state, MediaQuery.of(context).viewPadding.top));
      }),
    );
  }

  Widget makeBody(FavoriteState state, double top) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return _contentListView(state, top);
    }
  }

  Widget _contentListView(FavoriteState state, double top) {
    return GridView.builder(
        padding: EdgeInsets.only(left: 12, right: 12, top: top, bottom: 12),
        itemCount: state.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          childAspectRatio: 0.54,
        ),
        itemBuilder: (context, index) {
          return FavoriteItem(
            movie: state.items[index],
          );
        });
  }
}
