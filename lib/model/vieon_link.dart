import 'package:json_annotation/json_annotation.dart';

part 'vieon_link.g.dart';

@JsonSerializable()
class VieOnLink {
  @JsonKey(name: 'link_play')
  final LinkPlay? link;
  @JsonKey(name: 'play_links')
  final PlayLinks? playLinks;

  VieOnLink({this.link, this.playLinks});

  factory VieOnLink.fromJson(Map<String, dynamic> json) => _$VieOnLinkFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnLinkToJson(this);
}

@JsonSerializable()
class LinkPlay {
  @JsonKey(name: 'hls_link_play')
  final String? hls;

  LinkPlay({this.hls});

  factory LinkPlay.fromJson(Map<String, dynamic> json) => _$LinkPlayFromJson(json);
  Map<String, dynamic> toJson() => _$LinkPlayToJson(this);
}


@JsonSerializable()
class PlayLinks {
  final PlayLinkItem? h264;
  final PlayLinkItem? h265;

  PlayLinks({this.h264, this.h265});

  factory PlayLinks.fromJson(Map<String, dynamic> json) => _$PlayLinksFromJson(json);
  Map<String, dynamic> toJson() => _$PlayLinksToJson(this);
}

@JsonSerializable()
class PlayLinkItem {
  final String? hls;
  @JsonKey(name: 'hls_backup_1')
  final String? hlsBackup1;
  @JsonKey(name: 'hls_backup_2')
  final String? hlsBackup2;

  PlayLinkItem({this.hls, this.hlsBackup1, this.hlsBackup2});

  factory PlayLinkItem.fromJson(Map<String, dynamic> json) => _$PlayLinkItemFromJson(json);
  Map<String, dynamic> toJson() => _$PlayLinkItemToJson(this);
}