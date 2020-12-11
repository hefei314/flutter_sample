import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/app/global.dart';
import 'package:flutter_sample/support/route/routes.dart';

void main() => Global.init().then((value) {
      runApp(MyApp());
      // 设置Android状态栏透明
      if (Platform.isAndroid) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
      }
    });

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: Routes.routes,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
