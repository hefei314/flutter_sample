import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/common/common_photos_page.dart';
import 'package:flutter_sample/pages/common/common_web_page.dart';
import 'package:flutter_sample/pages/main/main_page.dart';
import 'package:flutter_sample/pages/splash/splash_page.dart';

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

  static final routes = {
    root: (context) => SplashPage(),
    main: (context) => MainPage(),
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
