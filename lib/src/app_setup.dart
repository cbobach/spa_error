library nighttrailaarhus.lib.client.src.page_list;

import 'package:polymer/polymer.dart';

import 'page.dart';

class AppSetup extends JsProxy {
  @reflectable
  List<Page> pages = new List<Page>();

  String name = 'spa';
  String icon = 'stars';
  int price = 80;

  AppSetup.fromMap(Map map) {
    if (map['name'] != null)
      this.name = map['name'];

    if (map['icon'] != null)
      this.icon = map['icon'];

    if (map['price'] != null)
      this.price = map['price'];

    if (map['pages'] != null) {
      for (Map page in map['pages']) {
        pages.add(new Page.fromMap(page));
      }
    }
  }

  String toString() => '\n\r\t{name: $name,\n\r\t icon: $icon,\n\r\t pages: $pages}';
}