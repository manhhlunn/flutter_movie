


abstract class PageEvent {}

class TabChange extends PageEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
