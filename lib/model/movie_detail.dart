import 'package:flutter_movie/const/string.dart';

class MovieDetail {
  final DetailData? data;

  const MovieDetail({required this.data});

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'data': Map<String, dynamic> json,
      } =>
        MovieDetail(data: DetailData.fromJson(json)),
      _ => throw const FormatException('Failed to load MovieDetail.'),
    };
  }
}

class DetailData {
  final Movie? item;

  const DetailData({required this.item});

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'item': Map<String, dynamic> json,
      } =>
        DetailData(item: Movie.fromJson(json)),
      _ => throw const FormatException('Failed to load DetailData.'),
    };
  }
}

class Movie {
  String? sId;
  String? name;
  String? slug;
  String? originName;
  String? content;
  String? thumbUrl;
  String? posterUrl;
  String? trailerUrl;
  String? time;
  String? episodeCurrent;
  String? episodeTotal;
  String? quality;
  String? lang;
  List<Category>? category;
  List<Country>? country;
  List<Episodes>? episodes;

  Movie(
      {this.sId,
      this.name,
      this.slug,
      this.originName,
      this.content,
      this.thumbUrl,
      this.posterUrl,
      this.trailerUrl,
      this.time,
      this.episodeCurrent,
      this.episodeTotal,
      this.quality,
      this.lang,
      this.category,
      this.country,
      this.episodes});

  Movie.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    originName = json['origin_name'];
    content = json['content'];
    thumbUrl = json['thumb_url'];
    posterUrl = json['poster_url'];
    trailerUrl = json['trailer_url'];
    time = json['time'];
    episodeCurrent = json['episode_current'];
    episodeTotal = json['episode_total'];
    quality = json['quality'];
    lang = json['lang'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country!.add(Country.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['origin_name'] = originName;
    data['content'] = content;
    data['thumb_url'] = thumbUrl;
    data['poster_url'] = posterUrl;
    data['trailer_url'] = trailerUrl;
    data['time'] = time;
    data['episode_current'] = episodeCurrent;
    data['episode_total'] = episodeTotal;
    data['quality'] = quality;
    data['lang'] = lang;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (country != null) {
      data['country'] = country!.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class Country {
  String? id;
  String? name;
  String? slug;

  Country({this.id, this.name, this.slug});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class Episodes {
  String? serverName;
  List<ServerData>? serverData;

  Episodes({this.serverName, this.serverData});

  Episodes.fromJson(Map<String, dynamic> json) {
    serverName = json['server_name'];
    if (json['server_data'] != null) {
      serverData = <ServerData>[];
      json['server_data'].forEach((v) {
        serverData!.add(ServerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_name'] = serverName;
    if (serverData != null) {
      data['server_data'] = serverData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServerData {
  String? name;
  String? slug;
  String? filename;
  String? linkEmbed;
  String? linkM3u8;

  ServerData(
      {this.name, this.slug, this.filename, this.linkEmbed, this.linkM3u8});

  ServerData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    filename = json['filename'];
    linkEmbed = json['link_embed'];
    linkM3u8 = json['link_m3u8'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['filename'] = filename;
    data['link_embed'] = linkEmbed;
    data['link_m3u8'] = linkM3u8;
    return data;
  }
}

extension MovieDetailExtension on MovieDetail {
  Map<String, String> get firstLine {
    return {
      StringValue.status: data?.item?.episodeCurrent ?? '',
      StringValue.episodeCount: data?.item?.episodeTotal ?? '',
      StringValue.duration: data?.item?.time ?? '',
    };
  }

  Map<String, String> get secondLine {
    return {
      StringValue.country:
          data?.item?.country?.map((e) => e.name).join(', ') ?? '',
      StringValue.quality: data?.item?.quality ?? '',
      StringValue.subtitle: data?.item?.lang ?? '',
    };
  }
}
