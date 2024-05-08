import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../dao/history_dao.dart';
import '../entity/app_movie.dart';
import '../entity/history_entity.dart';
import '../movie_detail_bloc/movie_detail_bloc.dart';
import '../widget/episodes.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  MovieDetailBloc movieDetailBloc = MovieDetailBloc();

  @override
  void initState() {
    movieDetailBloc.add(GetDetailEvent(movie: widget.movie));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    double width = query.size.width;
    final widget = BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          final Widget content;
          if (state.isLoading) {
            content = const Center(child: CircularProgressIndicator());
          } else {
            if (state.detail != null) {
              List<Widget> scrollChildren = [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    state.detail?.name ?? 'No name',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 8),
                  child: Text(
                    state.detail?.description ?? 'No description',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ];

              var servers = state.servers ?? [];
              if (servers.isNotEmpty) {
                scrollChildren.add(
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
                    child: Text(
                      'Servers',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
                scrollChildren.add(Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  child: ValuesWidget(
                    idx: state.currentServerIdx,
                    values: servers.map((e) => e.name).toList(),
                    onChanged: (value) {
                      movieDetailBloc.add(ChangeServerEvent(index: value));
                    },
                  ),
                ));
              }

              var items = state.episodes ?? [];
              if (items.isNotEmpty) {
                scrollChildren.add(
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
                    child: Text(
                      'Episodes',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
                scrollChildren.add(Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  child: ValuesWidget(
                    idx: state.currentEpisodeIdx,
                    values: items.map((e) => e.name).toList(),
                    onChanged: (value) {
                      movieDetailBloc.add(ChangeEpisodeEvent(index: value));
                    },
                  ),
                ));
                scrollChildren.add(const SizedBox(height: 20));
              }

              List<Widget> children = [
                SizedBox(height: query.padding.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      tooltip: 'Back to previous',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      tooltip: 'Favorite',
                      color: state.isFavorite ? Colors.red : Colors.grey,
                      onPressed: () {
                        movieDetailBloc.add(
                            FavoriteChangeEvent(isFavorite: !state.isFavorite));
                      },
                    )
                  ],
                ),
              ];

              var controller = state.controller;

              if (controller != null) {
                children.add(AspectRatio(
                    aspectRatio: controller.aspectRatio ?? 16 / 9,
                    child: Chewie(controller: controller)));
              } else {
                children.add(const AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
              }

              children.add(Expanded(child: ListView(children: scrollChildren)));
              content = Column(children: children);
            } else {
              content = Center(child: Text(state.failure.toString()));
            }
          }
          return Scaffold(body: content);
        });

    return BlocProvider<MovieDetailBloc>.value(
      value: movieDetailBloc,
      child: widget,
    );
  }

  @override
  Future<void> dispose() async {
    Future.delayed(Duration.zero, () async {
      final historyDao = GetIt.instance<HistoryDao>();
      final movie = movieDetailBloc.state.movie;
      if (movie != null) {
        var history = await historyDao.findById(movie.id);
        if (history != null) {
          await historyDao.deleteHistory(history);
        }

        final position = movieDetailBloc
                .state.videoPlayerController?.value.position.inMilliseconds ??
            0;

        await historyDao.insertHistory(History(
            movie.id,
            movie,
            movieDetailBloc.state.currentServerIdx,
            movieDetailBloc.state.currentEpisodeIdx,
            position));
      }

      movieDetailBloc.state.videoPlayerController?.dispose();
      movieDetailBloc.state.controller?.dispose();
    });
    super.dispose();
  }
}
