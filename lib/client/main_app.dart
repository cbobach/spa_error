@HtmlImport('main_app.html')
library nighttrailaarhus.lib.client.main_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/paper_drawer_panel.dart';

import 'package:route_hierarchical/client.dart';

import '../src/page.dart';
import '../src/app_setup.dart';
import '../src/setup.dart' as setup;

@PolymerRegister('main-app')
class MainApp extends PolymerElement {
  static var app = new AppSetup.fromMap(setup.app);

  @property
  String appName = app.name;

  @property
  String appIcon = app.icon;

  @property
  List<Page> pages = app.pages;

  @property
  Page selectedPage = app.pages[0];

  @property
  int route = 0;

  MainApp.created() : super.created();

  ready() {
    for (Page page in pages) {
//      Set up router
      router.root.addRoute(
          name: page.name,
          path: page.name,
          defaultRoute: page.isDefault,
          enter: enterRoute);
    }

    router.listen();
  }

//   Getting polymer elements from the DOM
  PaperDrawerPanel get paperDrawerPanel => $$('paper-drawer-panel');


//  The [router] that controls the app
  final Router router = new Router(useFragment: true);

//  Updates [route] whenever we enter a new route
  enterRoute(RouteEvent e) {
    if (e.path.isEmpty){
      set('route', 0);
    } else {
      set('route', pages.indexOf(pages.firstWhere((page) => page.name == e.path)));
    }

    set('selectedPage', pages[route]);
  }

//  Handle drawer when menu item is clicked
  @reflectable
  menuItemClicked(e, [_]) {
    set('selectedPage', pages[route]);
    router.go(selectedPage.name, {});

    paperDrawerPanel.setAttribute('selected', 'main');
  }
}