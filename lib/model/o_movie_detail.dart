
import 'package:json_annotation/json_annotation.dart';

part 'o_movie_detail.g.dart';

@JsonSerializable()
class OMovieDetailResponse {
  final OMovieDetailData? data;

  const OMovieDetailResponse({this.data});

  factory OMovieDetailResponse.fromJson(Map<String, dynamic> json) => _$OMovieDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OMovieDetailResponseToJson(this);
}

@JsonSerializable()
class OMovieDetailData {
  final OMovieDetail? item;

  const OMovieDetailData({this.item});

  factory OMovieDetailData.fromJson(Map<String, dynamic> json) => _$OMovieDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$OMovieDetailDataToJson(this);
}

@JsonSerializable()
class OMovieDetail {
  String? name;
  String? content;
  List<Episodes>? episodes;

  OMovieDetail(
      {this.name,
      this.content,
      this.episodes});

  factory OMovieDetail.fromJson(Map<String, dynamic> json) => _$OMovieDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OMovieDetailToJson(this);
}

@JsonSerializable()
class Episodes {
  @JsonKey(name: 'server_name') String? serverName;
  @JsonKey(name: 'server_data') List<ServerData>? serverData;

  Episodes({this.serverName, this.serverData});

  factory Episodes.fromJson(Map<String, dynamic> json) => _$EpisodesFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodesToJson(this);
}

@JsonSerializable()
class ServerData {
  String? name;
  @JsonKey(name: 'link_m3u8') String? linkM3u8;

  ServerData({this.name, this.linkM3u8});

  factory ServerData.fromJson(Map<String, dynamic> json) => _$ServerDataFromJson(json);
  Map<String, dynamic> toJson() => _$ServerDataToJson(this);
}
