import 'dart:convert';

import 'package:flutter_movie_app/model/o_movie_detail.dart';
import 'package:flutter_movie_app/model/vieon_item_detail.dart';
import 'package:flutter_movie_app/model/vieon_menu.dart';
import 'package:flutter_movie_app/model/vieon_menu_detail.dart';
import 'package:http/http.dart';

import '../model/o_movie.dart';
import '../model/vieon_link.dart';

class NetworkRequest {
  static const String oPhimDomain = "ophim1.com";
  static const String vieOnDomain = "api.vieon.vn";

  static Future<OMovieResponse> fetchList(
      String pageType, int page, String category, String country) async {
    final query = {'page': '$page', 'category': category, 'country': country};

    final uri = Uri.https(oPhimDomain, "/v1/api/$pageType", query);
    final response = await get(uri);
    if (response.statusCode == 200) {
      return OMovieResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetchList type: $pageType");
    }
  }

  static Future<OMovieResponse> searchList(String query, int page,
      String category, String country, String keyword) async {
    final query = {
      'page': '$page',
      'category': category,
      'country': country,
      'keyword': keyword
    };

    final uri = Uri.https(oPhimDomain, "/v1/api/tim-kiem", query);
    final response = await get(uri);
    if (response.statusCode == 200) {
      return OMovieResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to search: $query");
    }
  }

  static Future<OMovieDetailResponse> fetchData(String slug) async {
    final uri = Uri.https(oPhimDomain, "/v1/api/phim/$slug");
    final response = await get(uri);
    if (response.statusCode == 200) {
      return OMovieDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetchData slug:$slug');
    }
  }

  static Future<List<VieOnMenu>> fetchMenu() async {
    final uri = Uri.https(vieOnDomain, "/backend/cm/v5/menu");
    final response = await get(uri);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<VieOnMenu> menus =
          List<VieOnMenu>.from(l.map((model) => VieOnMenu.fromJson(model)));
      return menus;
    } else {
      throw Exception('Failed to fetchMenu');
    }
  }

  static Future<VieOnMenuDetails> fetchMenuDetail(
      String id, int page, int itemsPerPage) async {
    final query = {'page': '$page', 'limit': '$itemsPerPage'};
    final uri = Uri.https(vieOnDomain, "backend/cm/v5/ribbon/$id", query);
    final response = await get(uri);
    if (response.statusCode == 200) {
      return VieOnMenuDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetchMenuDetail');
    }
  }

  static Future<VieOnMenuDetails> searchVieOnItems(
      String query, int page, int itemsPerPage) async {
    final params = {
      'page': '$page',
      'limit': '$itemsPerPage',
      'keyword': query,
    };
    final uri = Uri.https(vieOnDomain, "backend/cm/v5/search", params);
    final response = await get(uri);
    if (response.statusCode == 200) {
      return VieOnMenuDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to searchVieOnItems');
    }
  }

  static Future<VieOnItemDetails> getVieOnItemDetail(String id) async {
    final uri = Uri.https(vieOnDomain, "backend/cm/v5/content/$id");
    final response = await get(uri);
    if (response.statusCode == 200) {
      return VieOnItemDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to getVieOnItemDetail');
    }
  }

  static Future<VieOnEpisode> getVieOnItemEpisode(
      String id, int page, int size) async {
    final params = {'page': '$page', 'limit': '$size'};
    final uri = Uri.https(vieOnDomain, "backend/cm/v5/episode/$id", params);
    final response = await get(uri);
    if (response.statusCode == 200) {
      return VieOnEpisode.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to getVieOnItemEpisode');
    }
  }

  static Future<VieOnLink> getVieOnEpisodeLink(
      String id, String? episode) async {
    late Uri uri;
    if (episode != null) {
      final params = {
        'eps_id': episode,
      };
      uri = Uri.https(vieOnDomain, "backend/cm/v5/content_detail/$id", params);
    } else {
      uri = Uri.https(vieOnDomain, "backend/cm/v5/content_detail/$id");
    }
    final response = await get(uri);
    if (response.statusCode == 200) {
      return VieOnLink.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to getVieOnEpisodeLink');
    }
  }
}
