// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vieon_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VieOnLink _$VieOnLinkFromJson(Map<String, dynamic> json) => VieOnLink(
      link: json['link_play'] == null
          ? null
          : LinkPlay.fromJson(json['link_play'] as Map<String, dynamic>),
      playLinks: json['play_links'] == null
          ? null
          : PlayLinks.fromJson(json['play_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VieOnLinkToJson(VieOnLink instance) => <String, dynamic>{
      'link_play': instance.link,
      'play_links': instance.playLinks,
    };

LinkPlay _$LinkPlayFromJson(Map<String, dynamic> json) => LinkPlay(
      hls: json['hls_link_play'] as String?,
    );

Map<String, dynamic> _$LinkPlayToJson(LinkPlay instance) => <String, dynamic>{
      'hls_link_play': instance.hls,
    };

PlayLinks _$PlayLinksFromJson(Map<String, dynamic> json) => PlayLinks(
      h264: json['h264'] == null
          ? null
          : PlayLinkItem.fromJson(json['h264'] as Map<String, dynamic>),
      h265: json['h265'] == null
          ? null
          : PlayLinkItem.fromJson(json['h265'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayLinksToJson(PlayLinks instance) => <String, dynamic>{
      'h264': instance.h264,
      'h265': instance.h265,
    };

PlayLinkItem _$PlayLinkItemFromJson(Map<String, dynamic> json) => PlayLinkItem(
      hls: json['hls'] as String?,
      hlsBackup1: json['hls_backup_1'] as String?,
      hlsBackup2: json['hls_backup_2'] as String?,
    );

Map<String, dynamic> _$PlayLinkItemToJson(PlayLinkItem instance) =>
    <String, dynamic>{
      'hls': instance.hls,
      'hls_backup_1': instance.hlsBackup1,
      'hls_backup_2': instance.hlsBackup2,
    };
