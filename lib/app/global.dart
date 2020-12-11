import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/support/net/http_utils.dart';
import 'package:flutter_sample/support/utils/sp_util.dart';
import 'package:package_info/package_info.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

///
/// author: hefei
/// time  : 2020/12/10
/// desc  :
///
class Global {
  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("v.vm.product");

  // 设备信息
  static IosDeviceInfo iosDeviceInfo;
  static AndroidDeviceInfo androidDeviceInfo;

  // 版本信息
  static PackageInfo packageInfo;

  ///
  /// 初始化全局配置
  ///
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // 初始化SharedPreferences
    await SpUtil.getInstance();
    // 初始化设备信息
    initDevice();
    // 初始化版本信息
    packageInfo = await PackageInfo.fromPlatform();
    // 初始化网络配置
    HttpUtils.init(
      baseUrl: "https://gank.io/api/v2/",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      interceptors: [LogInterceptor(requestBody: false)],
    );
  }

  ///
  /// 初始化设备信息
  ///
  static void initDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfo.iosInfo;
    } else if (Platform.isAndroid) {
      androidDeviceInfo = await deviceInfo.androidInfo;
    }
  }

  ///------------------------------全局变量------------------------------///

  static bool isFirstInstall() {
    return SpUtil.getBool("IS_FIRST_INSTALL", defValue: true);
  }

  static void setFirstInstall(bool isFirstInstall) {
    SpUtil.putBool("IS_FIRST_INSTALL", isFirstInstall);
  }

  static String getToken() {
    return SpUtil.getString("token", defValue: Platform.isIOS ? "iOS" : "Android");
  }

  static void setToken(String token) {
    SpUtil.putString("token", token);
  }
}
