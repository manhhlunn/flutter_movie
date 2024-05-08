import 'package:floor/floor.dart';
import 'package:flutter_movie_app/util/home_page.dart';

class HomePageConverter extends TypeConverter<HomePage, int> {
  @override
  HomePage decode(int databaseValue) {
    return HomePage.values[databaseValue];
  }

  @override
  int encode(HomePage value) {
    return value.index;
  }
}
