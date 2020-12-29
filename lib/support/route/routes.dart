import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/common/common_photos_page.dart';
import 'package:flutter_sample/pages/common/common_web_page.dart';
import 'package:flutter_sample/pages/main/main_page.dart';
import 'package:flutter_sample/pages/splash/splash_page.dart';
import 'package:flutter_sample/pages/widgets/component/widget_bottom_navigation_bar_page.dart';
import 'package:flutter_sample/pages/widgets/component/widget_drawer_page.dart';
import 'package:flutter_sample/pages/widgets/component/widget_grid_view_page.dart';
import 'package:flutter_sample/pages/widgets/component/widget_list_view_page.dart';
import 'package:flutter_sample/pages/widgets/component/widget_tab_bar_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_button_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_checkbox_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_icon_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_image_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_radio_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_switch_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_text_field_page.dart';
import 'package:flutter_sample/pages/widgets/element/widget_text_page.dart';
import 'package:flutter_sample/pages/widgets/function/widget_dailog_page.dart';
import 'package:flutter_sample/pages/widgets/layout/widget_stack_page.dart';

///
/// author: hefei
/// time  : 2019/10/19
/// desc  : 路由管理
///
class Routes {
  // root
  static String root = "/";

  // main
  static String main = "/main";

  // common
  static String commonWeb = "/commonWeb";
  static String commonPhotos = "/commonPhotos";

  // widgets
  static String widgetsElementIcon = "/widgetsElementIcon";
  static String widgetsElementText = "/widgetsElementText";
  static String widgetsElementImage = "/widgetsElementImage";
  static String widgetsElementButton = "/widgetsElementButton";
  static String widgetsElementTextField = "/widgetsElementTextField";
  static String widgetsElementRadio = "/widgetsElementRadio";
  static String widgetsElementSwitch = "/widgetsElementSwitch";
  static String widgetsElementCheckbox = "/widgetsElementCheckbox";

  static String widgetsStack = "/widgetsStack";

  static String widgetsCard = "/widgetsCard";
  static String widgetsDrawer = "/widgetsDrawer";
  static String widgetsTabBar = "/widgetsTabBar";
  static String widgetsListView = "/widgetsListView";
  static String widgetsGridView = "/widgetsGridView";
  static String widgetsBottomNavigationBar = "/widgetsBottomNavigationBar";

  static String widgetsDialog = "/widgetsDialog";

  static final routes = {
    root: (context) => SplashPage(),
    main: (context) => MainPage(),
    // element
    widgetsElementIcon: (context) => WidgetIconPage(),
    widgetsElementText: (context) => WidgetTextPage(),
    widgetsElementImage: (context) => WidgetImagePage(),
    widgetsElementButton: (context) => WidgetButtonPage(),
    widgetsElementTextField: (context) => WidgetTextFieldPage(),
    widgetsElementRadio: (context) => WidgetRadioPage(),
    widgetsElementSwitch: (context) => WidgetSwitchPage(),
    widgetsElementCheckbox: (context) => WidgetCheckboxPage(),
    // layout
    widgetsStack: (context) => WidgetStackPage(),
    // component
    widgetsCard: (context) => WidgetStackPage(),
    widgetsDrawer: (context) => WidgetDrawerPage(),
    widgetsTabBar: (context) => WidgetTabBarPage(),
    widgetsListView: (context) => WidgetListViewPage(),
    widgetsGridView: (context) => WidgetGridViewPage(),
    widgetsBottomNavigationBar: (context) => WidgetBottomNavigationBarPage(),
    // function
    widgetsDialog: (context) => WidgetDialogPage(),
  };

  static final unBindRoutes = {
    commonWeb: (context, {arguments}) => CommonWebPage(
          url: arguments["url"],
          title: arguments["title"],
        ),
    commonPhotos: (context, {arguments}) => CommonPhotosPage(
          images: arguments["images"],
        ),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String name = settings.name;
    Function pageContentBuilder = unBindRoutes[name];
    print("route: " + name + " arguments: " + settings.arguments.toString());
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        return MaterialPageRoute(
            builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      } else {
        return MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      }
    }
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text("Page not found"),
        ),
      );
    });
  }
}
