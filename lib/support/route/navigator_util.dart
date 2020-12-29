import 'package:flutter/material.dart';
import 'package:flutter_sample/support/route/routes.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// author: hefei
/// time  : 2019/10/19
/// desc  : 路由跳转
///
class NavigatorUtil {
  ///
  /// 跳转到主页
  ///
  static void goMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.main);
  }

  ///
  /// 跳转页面
  ///
  static void goPage(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///
  /// 跳转到通用web页
  ///
  static void goCommonWebPage(BuildContext context, String url, String title) {
    Navigator.pushNamed(context, Routes.commonWeb, arguments: {"url": url, "title": title});
  }

  ///
  /// 跳转到通用Photos页
  ///
  static void goCommonPhotosPage(BuildContext context, List<String> images) {
    Navigator.pushNamed(context, Routes.commonPhotos, arguments: {"images": images});
  }

  ///
  /// 跳转到默认浏览器
  ///
  static void goDefaultBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
