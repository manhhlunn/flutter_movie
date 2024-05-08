import 'package:json_annotation/json_annotation.dart';

part 'vieon_menu_detail.g.dart';

@JsonSerializable()
class VieOnMenuDetails {
  final List<VieOnItem>? items;
  final VieOnMetaData? metadata;

  VieOnMenuDetails({this.items, this.metadata});

  factory VieOnMenuDetails.fromJson(Map<String, dynamic> json) =>
      _$VieOnMenuDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnMenuDetailsToJson(this);
}

@JsonSerializable()
class VieOnItem {
  final String? id;
  final String? title;
  final VieOnImage? images;

  @JsonKey(name: 'is_premium')
  final int? isPremium;

  VieOnItem({this.id, this.title, this.images, this.isPremium});

  factory VieOnItem.fromJson(Map<String, dynamic> json) =>
      _$VieOnItemFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnItemToJson(this);
}

@JsonSerializable()
class VieOnImage {
  @JsonKey(name: 'poster_v4')
  final String? poster;

  VieOnImage({this.poster});

  factory VieOnImage.fromJson(Map<String, dynamic> json) =>
      _$VieOnImageFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnImageToJson(this);
}

@JsonSerializable()
class VieOnMetaData {
  final int? total;
  final int? page;

  VieOnMetaData({this.total, this.page});

  factory VieOnMetaData.fromJson(Map<String, dynamic> json) =>
      _$VieOnMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$VieOnMetaDataToJson(this);
}