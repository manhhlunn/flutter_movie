import 'package:floor/floor.dart';
import 'package:flutter_movie_app/model/o_movie.dart';
import 'package:flutter_movie_app/model/o_movie_detail.dart';
import 'package:flutter_movie_app/util/home_page.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/vieon_item_detail.dart';
import '../model/vieon_menu_detail.dart';

part 'app_movie.g.dart';

@entity
@JsonSerializable()
class Movie {
  @primaryKey
  final String id;
  final String image;
  final String name;
  final String? content;
  final HomePage homePage;

  const Movie(
      {required this.id,
      required this.image,
      required this.name,
      required this.content,
      required this.homePage});

  factory Movie.fromOMovie(OMovie oMovie) {
    return Movie(
        id: oMovie.slug ?? '',
        image: oMovie.thumbUrl ?? '',
        name: oMovie.name ?? '',
        content: oMovie.quality,
        homePage: HomePage.ophim);
  }

  factory Movie.fromVieOnItem(VieOnItem vieOnItem) {
    return Movie(
        id: vieOnItem.id ?? '',
        image: vieOnItem.images?.poster ?? '',
        name: vieOnItem.title ?? '',
        content: vieOnItem.isPremium == 1 ? 'Vip' : 'Free',
        homePage: HomePage.vieon);
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

class MovieDetail {
  final String? name;
  final String? description;

  const MovieDetail({required this.name, required this.description});

  factory MovieDetail.fromOMovie(OMovieDetailResponse oMovie) {
    return MovieDetail(
        name: oMovie.data?.item?.name, description: oMovie.data?.item?.content);
  }

  factory MovieDetail.fromVieOnItem(VieOnItemDetails vieOnItem) {
    return MovieDetail(
        name: vieOnItem.title, description: vieOnItem.description);
  }
}

class MovieLink {
  final String name;
  final String url;

  const MovieLink({required this.name, required this.url});
}

class MovieEpisode {
  final String id;
  final String name;
  final List<MovieLink>? servers;

  const MovieEpisode(
      {required this.id, required this.name, required this.servers});
}
