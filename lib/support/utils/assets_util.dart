import 'package:flutter/material.dart';
import 'package:flutter_sample/app/constants.dart';

///
/// author: hefei
/// time  : 2020/10/19
/// desc  :
///
class AssetsUtil {
  ///
  /// 获取闪屏页背景
  ///
  static Widget getSplashBackground(int index) {
    String path = index == 0
        ? "assets/images/bg_splash.png"
        : "assets/images/bg_splash${index.toString()}.png";
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color(Constants.splashBackgroundColors[index]),
      child: Image(
        image: AssetImage(path),
        fit: BoxFit.contain,
      ),
    );
  }
}
