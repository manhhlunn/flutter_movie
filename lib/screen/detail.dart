import 'package:better_player/better_player.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/dao/history_dao.dart';
import 'package:flutter_movie/detail_bloc/movie_detail_bloc.dart';
import 'package:flutter_movie/entity/history_entity.dart';
import 'package:flutter_movie/model/movie_detail.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:flutter_movie/widget/data_detail.dart';
import 'package:flutter_movie/widget/episodes.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final String slug;

  const DetailScreen({super.key, required this.slug});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late BetterPlayerController _currentPlayerController;
  MovieDetailBloc movieDetailBloc = MovieDetailBloc();

  @override
  void initState() {
    _currentPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
            autoPlay: true,
            fit: BoxFit.contain,
            autoDetectFullscreenDeviceOrientation: true,
            expandToFill: false));
    movieDetailBloc.add(GetDetailEvent(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    double width = query.size.width;
    final widget = BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: (context, state) {
      if (state.currentEpisodes != null) {
        setController(state.currentEpisodes!, state.currentEpisodeIdx,
            state.startPosition);
      }
    }, builder: (context, state) {
      final Widget content;
      if (state.isLoading) {
        content = const Center(child: CircularProgressIndicator());
      } else {
        if (state.detail != null) {
          var children = [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  tooltip: 'Back to previous',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FancyShimmerImage(
                    imageUrl:
                        "${NetworkRequest.imageDomain}${state.detail?.data?.item?.thumbUrl}",
                    width: width / 3,
                    height: ((width / 3) * 3) / 2,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.ondemand_video_rounded),
                  tooltip: 'Open trailer',
                  onPressed: () {
                    var uri =
                        Uri.parse(state.detail?.data?.item?.trailerUrl ?? '');
                    launchUrl(uri);
                  },
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, top: 8, bottom: 0, right: 20),
              child: Text(
                state.detail?.data?.item?.name ?? 'No name',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 0, bottom: 12, right: 20),
              child: Text(
                "(${state.detail?.data?.item?.originName ?? 'No origin name'})",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 36,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: state.detail?.data?.item?.category
                          ?.map((e) => Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromRGBO(105, 105, 105, 100),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                e.name ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              )))
                          .toList() ??
                      []),
            ),
            DataDetailWidget(values: state.detail?.firstLine ?? {}),
            DataDetailWidget(values: state.detail?.secondLine ?? {}),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                state.detail?.data?.item?.content ?? 'No description',
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            BetterPlayer(controller: _currentPlayerController)
          ];

          var items = state.detail?.data?.item?.episodes ?? [];
          if (items.isNotEmpty) {
            children.add(Container(
              alignment: Alignment.centerLeft,
              width: width,
              child: EpisodesWidget(
                episode: state.currentEpisodes,
                index: state.currentEpisodeIdx,
                episodes: items,
                onChanged: (value) {
                  movieDetailBloc.add(ChangeEpisodeEvent(
                      episodes: value.episode, index: value.index));
                },
              ),
            ));
          }

          content = ListView(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: FancyShimmerImage(
                imageUrl:
                    "${NetworkRequest.imageDomain}${state.detail?.data?.item?.posterUrl}",
                width: width,
                height: (width * 9) / 16,
              ),
            ),
            Transform.translate(
                offset: const Offset(0, -50), child: Column(children: children))
          ]);
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

  Duration? position;

  @override
  Future<void> dispose() async {
    Future.delayed(Duration.zero, () async {
      final historyDao = GetIt.instance<HistoryDao>();
      final history = await historyDao.findById(widget.slug);
      final episode = movieDetailBloc.state.currentEpisodes;
      final position = this.position?.inMilliseconds ?? 0;
      if (episode != null) {
        final serverIndex = movieDetailBloc.state.detail?.data?.item?.episodes
            ?.indexOf(episode);
        if (history != null) {
          historyDao.updateHistory(history.copyWith(
              name: movieDetailBloc.state.detail?.data?.item?.name,
              image: movieDetailBloc.state.detail?.data?.item?.thumbUrl,
              serverIndex: serverIndex ?? 0,
              episodeIndex: movieDetailBloc.state.currentEpisodeIdx,
              position: position));
        } else {
          historyDao.insertHistory(History(
              widget.slug,
              movieDetailBloc.state.detail?.data?.item?.name ?? 'No name',
              movieDetailBloc.state.detail?.data?.item?.thumbUrl ?? '',
              serverIndex ?? 0,
              movieDetailBloc.state.currentEpisodeIdx,
              position,
              DateTime.now().millisecondsSinceEpoch));
        }
      }

      _currentPlayerController.dispose();
    });
    super.dispose();
  }

  void setController(Episodes data, int idx, int initial) {
    _currentPlayerController.setupDataSource(createDataSource(data, idx));
    _currentPlayerController.addEventsListener((p0) => {
          position =
              _currentPlayerController.videoPlayerController?.value.position,
          if (p0.betterPlayerEventType == BetterPlayerEventType.initialized)
            {_currentPlayerController.seekTo(Duration(milliseconds: initial))}
          else if (p0.betterPlayerEventType == BetterPlayerEventType.finished)
            {nextVideo()}
        });
  }

  BetterPlayerDataSource createDataSource(Episodes data, int idx) {
    var serverData = data.serverData?[idx];
    return BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, serverData?.linkM3u8 ?? '');
  }

  void nextVideo() {
    movieDetailBloc.add(const NextEpisodeEvent());
  }
}
