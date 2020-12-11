import 'package:flutter_sample/support/bean/splash_bean.dart';

///
/// author: hefei
/// time  : 2020/10/20
/// desc  :
///
class Constants {
  static const String KEY_SPLASH_INFO = "KEY_SPLASH_INFO";

  ///
  /// 闪屏页背景颜色数据
  ///
  static final List<int> splashBackgroundColors = [
    0xFFD3E8F8,
    0xFFBDD9B8,
    0xFF97D7F7,
    0xFF164E95,
    0xFFF2D9E6
  ];

  ///
  /// 闪屏页数据
  ///
  static Future<SplashBean> getSplash() {
    return Future.delayed(Duration(milliseconds: 1000), () {
      return SplashBean(
        title: '北极熊',
        content: '通戈山国家公园中的北极熊，加拿大 (© Cavan Images/Offset by Shutterstock)',
        url: 'https://cn.bing.com/',
        imgUrl:
        'https://cn.bing.com/th?id=OHR.TorngatsMt_ZH-CN9391633217_540x900.jpg',
      );
    });
  }
}
