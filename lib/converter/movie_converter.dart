import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';

class MovieConverter extends TypeConverter<Movie, String> {
  @override
  Movie decode(String databaseValue) {
    return Movie.fromJson(jsonDecode(databaseValue));
  }

  @override
  String encode(Movie value) {
    return jsonEncode(value.toJson());
  }
}
