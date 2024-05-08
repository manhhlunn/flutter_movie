import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';
import 'package:flutter_movie_app/model/vieon_link.dart';
import 'package:flutter_movie_app/util/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

import '../dao/favorite_dao.dart';
import '../dao/history_dao.dart';
import '../network/network_request.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(const MovieDetailState()) {
    final historyDao = GetIt.instance<HistoryDao>();
    final favoritesDao = GetIt.instance<FavoriteDao>();

    on<GetDetailEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final history = await historyDao.findById(event.movie.id);
      final favorite = await favoritesDao.findById(event.movie.id);
      try {
        switch (event.movie.homePage) {
          case HomePage.ophim:
            {
              final movie = await NetworkRequest.fetchData(event.movie.id);
              List<MovieEpisode> movieEpisodes = [];
              var episodes = movie.data?.item?.episodes
                  ?.elementAtOrNull(history?.serverIndex ?? 0)
                  ?.serverData;
              var servers =
                  movie.data?.item?.episodes?.map((e) => e.serverName ?? '');
              if (episodes != null) {
                for (var i = 0; i < episodes.length; i++) {
                  var episode = episodes[i];
                  var sources = movie.data?.item?.episodes
                      ?.map((e) {
                        var data = e.serverData?.elementAtOrNull(i);
                        if (data != null) {
                          return MovieLink(
                              name: data.name ?? '', url: data.linkM3u8 ?? '');
                        }
                      })
                      .whereType<MovieLink>()
                      .toList();
                  movieEpisodes.add(MovieEpisode(
                      id: i.toString(),
                      name: episode.name ?? '',
                      servers: sources));
                }
              }

              emit(state.copyWith(
                isLoading: false,
                movie: event.movie,
                detail: MovieDetail.fromOMovie(movie),
                servers:
                    servers?.map((e) => MovieLink(name: e, url: "")).toList(),
                episodes: movieEpisodes,
                currentServerIdx: history?.serverIndex,
                currentEpisodeIdx: history?.episodeIndex,
                startPosition: history?.position,
                isFavorite: favorite != null,
              ));
            }

          case HomePage.vieon:
            {
              final movie =
                  await NetworkRequest.getVieOnItemDetail(event.movie.id);
              var episodes = [];
              if (movie.id != null &&
                  movie.episode != null &&
                  movie.episode! > 0) {
                int page = 0;
                int size = 60;

                do {
                  var result = await NetworkRequest.getVieOnItemEpisode(
                      movie.id!, page, size);
                  var metadataPage = result.metadata?.page ?? 0;
                  var total = result.metadata?.total ?? 0;
                  episodes.addAll(result.items ?? []);
                  if ((metadataPage + 1) * size < total) {
                    page += 1;
                  } else {
                    break;
                  }
                } while (true);
              }

              emit(state.copyWith(
                  isLoading: false,
                  movie: event.movie,
                  detail: MovieDetail.fromVieOnItem(movie),
                  servers: null,
                  episodes: episodes
                      .map((e) => MovieEpisode(
                            id: e.id ?? '',
                            name:
                                '${e.title} (${(e.isPremium == 1 ? 'Vip' : 'Free')})',
                            servers: null,
                          ))
                      .toList(),
                  currentServerIdx: history?.serverIndex,
                  currentEpisodeIdx: history?.episodeIndex,
                  startPosition: history?.position,
                  isFavorite: favorite != null));

              var servers = await getEpisodeServers(state);
              emit(state.copyWith(servers: servers));
            }
        }

        var videoControl = createVideoPlayerController(state);
        if (videoControl != null) {
          var controller = await createController(videoControl, state);
          emit(state.copyWith(
              controller: controller, videoPlayerController: videoControl));
        }
      } on Exception catch (error) {
        emit(state.copyWith(failure: error, isLoading: false));
      }
    });

    on<ChangeEpisodeEvent>((event, emit) async {
      try {
        emit(state.copyWith(currentEpisodeIdx: event.index, startPosition: 0));
        switch (state.movie?.homePage) {
          case HomePage.ophim:
            {}
          case HomePage.vieon:
            {
              var servers = await getEpisodeServers(state);
              emit(state.copyWith(servers: servers));
            }
          case null:
            {}
        }
        var videoControl = createVideoPlayerController(state);
        if (videoControl != null) {
          var controller = await createController(videoControl, state);
          emit(state.copyWith(
              controller: controller, videoPlayerController: videoControl));
        }
      } on Exception catch (error) {
        emit(state.copyWith(failure: error, isLoading: false));
      }
    });

    on<ChangeServerEvent>((event, emit) async {
      emit(state.copyWith(currentServerIdx: event.index));
      var videoControl = createVideoPlayerController(state);
      if (videoControl != null) {
        var controller = await createController(videoControl, state);
        emit(state.copyWith(
            controller: controller, videoPlayerController: videoControl));
      }
    });

    on<FavoriteChangeEvent>((event, emit) async {
      var fav = state.movie;
      if (fav != null) {
        if (event.isFavorite) {
          favoritesDao.insertFavorite(fav);
        } else {
          favoritesDao.deleteFavorite(fav.id);
        }
        emit(state.copyWith(isFavorite: event.isFavorite));
      }
    });
  }

  Future<ChewieController> createController(
      VideoPlayerController controller, MovieDetailState state) async {
    await controller.initialize();
    return ChewieController(
      autoInitialize: true,
      autoPlay: true,
      aspectRatio: controller.value.aspectRatio,
      videoPlayerController: controller,
      startAt: Duration(milliseconds: state.startPosition),
    );
  }

  VideoPlayerController? createVideoPlayerController(MovieDetailState state) {
    var movieLink = state.episodes
        ?.elementAtOrNull(state.currentEpisodeIdx)
        ?.servers
        ?.elementAtOrNull(state.currentServerIdx);
    if (movieLink != null) {
      return VideoPlayerController.networkUrl(Uri.parse(movieLink.url),
          formatHint: VideoFormat.hls);
    } else {
      var movieLink = state.servers?.elementAtOrNull(state.currentServerIdx);
      if (movieLink != null) {
        return VideoPlayerController.networkUrl(Uri.parse(movieLink.url),
            formatHint: VideoFormat.hls);
      }
    }
    return null;
  }

  Future<List<MovieLink>?> getEpisodeServers(MovieDetailState state) async {
    late VieOnLink link;
    var movie = state.movie;
    if (movie != null) {
      if (state.episodes?.isEmpty == true) {
        link = await NetworkRequest.getVieOnEpisodeLink(movie.id, null);
      } else {
        var episode = state.episodes?.elementAtOrNull(state.currentEpisodeIdx);
        if (episode != null) {
          link = await NetworkRequest.getVieOnEpisodeLink(movie.id, episode.id);
        } else {
          return null;
        }
      }
    } else {
      return null;
    }

    List<MovieLink> servers = [];
    if (link.link?.hls?.isNotEmpty == true) {
      servers.add(MovieLink(name: "Original", url: link.link?.hls ?? ''));
    }

    if (link.playLinks?.h264?.hls?.isNotEmpty == true) {
      servers
          .add(MovieLink(name: "H264", url: link.playLinks?.h264?.hls ?? ''));
    }

    if (link.playLinks?.h264?.hlsBackup1?.isNotEmpty == true) {
      servers.add(MovieLink(
          name: "H264 backup 1", url: link.playLinks?.h264?.hlsBackup1 ?? ''));
    }

    if (link.playLinks?.h264?.hlsBackup2?.isNotEmpty == true) {
      servers.add(MovieLink(
          name: "H264 backup 2", url: link.playLinks?.h264?.hlsBackup2 ?? ''));
    }

    if (link.playLinks?.h265?.hls?.isNotEmpty == true) {
      servers
          .add(MovieLink(name: "H265", url: link.playLinks?.h265?.hls ?? ''));
    }

    if (link.playLinks?.h265?.hlsBackup1?.isNotEmpty == true) {
      servers.add(MovieLink(
          name: "H265 backup 1", url: link.playLinks?.h265?.hlsBackup1 ?? ''));
    }

    if (link.playLinks?.h265?.hlsBackup2?.isNotEmpty == true) {
      servers.add(MovieLink(
          name: "H265 backup 2", url: link.playLinks?.h265?.hlsBackup2 ?? ''));
    }

    return servers;
  }
}
