import 'package:better_player/better_player.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_detail.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:flutter_movie/widget/data_detail.dart';
import 'package:flutter_movie/widget/episodes.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final String slug;

  const DetailScreen({super.key, required this.slug});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetail> futureMovie;

  Episodes? _currentEpisodes;
  int _currentEpisodeIdx = 0;
  late BetterPlayerController _currentPlayerController;

  @override
  void initState() {
    super.initState();
    futureMovie = NetworkRequest.fetchData(widget.slug);
    _currentPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
            autoPlay: true,
            fit: BoxFit.contain,
            autoDetectFullscreenDeviceOrientation: true,
            expandToFill: false
        ));
    _currentPlayerController.addEventsListener((p0) => {
          if (p0.betterPlayerEventType == BetterPlayerEventType.finished)
            nextVideo()
        });
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    double width = query.size.width;
    return Scaffold(
        body: FutureBuilder<MovieDetail>(
            future: futureMovie,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
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
                              imageUrl: snapshot.data?.movie?.thumbUrl ?? '',
                              width: width / 3,
                              height: ((width / 3) * 3) / 2,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.ondemand_video_rounded),
                            tooltip: 'Open trailer',
                            onPressed: () {
                              var uri = Uri.parse(
                                  snapshot.data?.movie?.trailerUrl ?? '');
                              launchUrl(uri);
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 8, bottom: 0, right: 20),
                        child: Text(
                          snapshot.data?.movie?.name ?? 'No name',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 0, bottom: 12, right: 20),
                        child: Text(
                          "(${snapshot.data?.movie?.originName ?? 'No origin name'})",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data?.movie?.category
                                    ?.map((e) => Container(
                                        margin: const EdgeInsets.only(right: 6),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color.fromRGBO(
                                              105, 105, 105, 100),
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
                      DataDetailWidget(values: snapshot.data?.firstLine ?? {}),
                      DataDetailWidget(values: snapshot.data?.secondLine ?? {}),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          snapshot.data?.movie?.content ?? 'No description',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      BetterPlayer(controller: _currentPlayerController)
                    ];

                    var detail = snapshot.data;
                    var items = detail?.episodes ?? [];
                    if (items.isNotEmpty) {
                      if (_currentEpisodes == null) {
                        setController(items.first, 0);
                      }
                      children.add(Container(
                        alignment: Alignment.centerLeft,
                        width: width,
                        child: EpisodesWidget(
                          episode: _currentEpisodes!,
                          index: _currentEpisodeIdx,
                          episodes: items,
                          onChanged: (value) {
                            setState(() {
                              setController(value.episode, value.index);
                            });
                          },
                        ),
                      ));
                    }

                    return ListView(children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        child: FancyShimmerImage(
                          imageUrl: snapshot.data?.movie?.posterUrl ?? '',
                          width: width,
                          height: (width * 9) / 16,
                        ),
                      ),
                      Transform.translate(
                          offset: const Offset(0, -50),
                          child: Column(children: children))
                    ]);
                  }
              }
            }));
  }

  @override
  void dispose() {
    _currentPlayerController.dispose();
    super.dispose();
  }

  void setController(Episodes data, int idx) {
    _currentEpisodes = data;
    _currentEpisodeIdx = idx;
    _currentPlayerController.setupDataSource(createDataSource(data, idx));
  }

  BetterPlayerDataSource createDataSource(Episodes data, int idx) {
    var serverData = data.serverData?[idx];
    return BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, serverData?.linkM3u8 ?? '');
  }

  void nextVideo() {
    int? maxSize = _currentEpisodes?.serverData?.length;
    if (maxSize != null && _currentEpisodeIdx <= maxSize - 1) {
      setState(() {
        _currentEpisodeIdx = _currentEpisodeIdx + 1;
      });
    }
  }
}
