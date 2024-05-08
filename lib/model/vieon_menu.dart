import 'package:json_annotation/json_annotation.dart';

part 'vieon_menu.g.dart';

@JsonSerializable()
class VieOnMenu {
  final String? id;
  final String? name;

  @JsonKey(name: 'sub_menu')
  final List<VieOnMenu>? subMenu;

  @JsonKey(name: 'sub_menu_ribbon')
  final List<VieOnMenu>? subMenuRibbon;

  VieOnMenu({this.id, this.name, this.subMenu, this.subMenuRibbon});

  factory VieOnMenu.fromJson(Map<String, dynamic> json) =>
      _$VieOnMenuFromJson(json);

  Map<String, dynamic> toJson() => _$VieOnMenuToJson(this);

  VieOnMenu copyWith({required String name}) {
    return VieOnMenu(
      id: id,
      name: name,
      subMenu: subMenu,
      subMenuRibbon: subMenuRibbon,
    );
  }
}

extension GetAllMenuExtension on List<VieOnMenu> {
  List<VieOnMenu> getAllMenu() {
    List<VieOnMenu> items = [];
    forEach((it) {
      if (it.subMenuRibbon != null) {
        items.addAll(it.subMenuRibbon!.map((menu) {
          List words = [
            it.name?.split(" "),
            menu.name?.split(" ")
          ].expand((element) => element ?? []).toSet().toList();
          return menu.copyWith(name: words.join(" "));
        }));
      }
    });
    return items;
  }
}
