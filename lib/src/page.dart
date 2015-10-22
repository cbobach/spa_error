library nighttrailaarhus.lib.client.src.page;

import 'package:polymer/polymer.dart';

class Page extends JsProxy {
  bool isDefault = false;

  @reflectable
  String name = 'dafault';

  @reflectable
  String icon = 'label-outline';

  Page.fromMap(Map map) {
    if (map['name'] != null)
      this.name = map['name'];

    if (map['icon'] != null)
      this.icon = map['icon'];

    if (map['isDefault'] != null) {
      this.isDefault = true;
    }
  }

  String toString() => '\n\r\t{name: $name,\n\r\t icon: $icon,\n\r\t isDefault: $isDefault}';
}