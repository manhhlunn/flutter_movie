class MovieDetail {
  bool? status;
  String? msg;
  Movie? movie;
  List<Episodes>? episodes;

  MovieDetail({this.status, this.msg, this.movie, this.episodes});

  MovieDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (movie != null) {
      data['movie'] = movie!.toJson();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  Created? created;
  Created? modified;
  String? sId;
  String? name;
  String? slug;
  String? originName;
  String? content;
  String? type;
  String? status;
  String? thumbUrl;
  String? posterUrl;
  bool? isCopyright;
  bool? subDocquyen;
  bool? chieurap;
  String? trailerUrl;
  String? time;
  String? episodeCurrent;
  String? episodeTotal;
  String? quality;
  String? lang;
  String? notify;
  String? showtimes;
  int? year;
  int? view;
  List<String>? actor;
  List<String>? director;
  List<Category>? category;
  List<Country>? country;

  Movie(
      {this.created,
      this.modified,
      this.sId,
      this.name,
      this.slug,
      this.originName,
      this.content,
      this.type,
      this.status,
      this.thumbUrl,
      this.posterUrl,
      this.isCopyright,
      this.subDocquyen,
      this.chieurap,
      this.trailerUrl,
      this.time,
      this.episodeCurrent,
      this.episodeTotal,
      this.quality,
      this.lang,
      this.notify,
      this.showtimes,
      this.year,
      this.view,
      this.actor,
      this.director,
      this.category,
      this.country});

  Movie.fromJson(Map<String, dynamic> json) {
    created =
        json['created'] != null ? Created.fromJson(json['created']) : null;
    modified =
        json['modified'] != null ? Created.fromJson(json['modified']) : null;
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    originName = json['origin_name'];
    content = json['content'];
    type = json['type'];
    status = json['status'];
    thumbUrl = json['thumb_url'];
    posterUrl = json['poster_url'];
    isCopyright = json['is_copyright'];
    subDocquyen = json['sub_docquyen'];
    chieurap = json['chieurap'];
    trailerUrl = json['trailer_url'];
    time = json['time'];
    episodeCurrent = json['episode_current'];
    episodeTotal = json['episode_total'];
    quality = json['quality'];
    lang = json['lang'];
    notify = json['notify'];
    showtimes = json['showtimes'];
    year = json['year'];
    view = json['view'];
    actor = json['actor'].cast<String>();
    director = json['director'].cast<String>();
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (created != null) {
      data['created'] = created!.toJson();
    }
    if (modified != null) {
      data['modified'] = modified!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['origin_name'] = originName;
    data['content'] = content;
    data['type'] = type;
    data['status'] = status;
    data['thumb_url'] = thumbUrl;
    data['poster_url'] = posterUrl;
    data['is_copyright'] = isCopyright;
    data['sub_docquyen'] = subDocquyen;
    data['chieurap'] = chieurap;
    data['trailer_url'] = trailerUrl;
    data['time'] = time;
    data['episode_current'] = episodeCurrent;
    data['episode_total'] = episodeTotal;
    data['quality'] = quality;
    data['lang'] = lang;
    data['notify'] = notify;
    data['showtimes'] = showtimes;
    data['year'] = year;
    data['view'] = view;
    data['actor'] = actor;
    data['director'] = director;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (country != null) {
      data['country'] = country!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Created {
  String? time;

  Created({this.time});

  Created.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
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
      "Trạng thái": movie?.episodeCurrent ?? '',
      "Số tập": movie?.episodeTotal ?? '',
      "Thời lượng": movie?.time ?? '',
    };
  }

  Map<String, String> get secondLine {
    return {
      "Quốc gia": movie?.country?.map((e) => e.name).join(', ') ?? '',
      "Chất lượng": movie?.quality ?? '',
      "Phiên dịch": movie?.lang ?? '',
    };
  }
}
