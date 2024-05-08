// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vieon_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VieOnMenu _$VieOnMenuFromJson(Map<String, dynamic> json) => VieOnMenu(
      id: json['id'] as String?,
      name: json['name'] as String?,
      subMenu: (json['sub_menu'] as List<dynamic>?)
          ?.map((e) => VieOnMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      subMenuRibbon: (json['sub_menu_ribbon'] as List<dynamic>?)
          ?.map((e) => VieOnMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VieOnMenuToJson(VieOnMenu instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sub_menu': instance.subMenu,
      'sub_menu_ribbon': instance.subMenuRibbon,
    };
