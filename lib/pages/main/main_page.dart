import 'package:flutter/material.dart';

///
/// author: hefei
/// time  : 2020/12/11
/// desc  : 主页面
///
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Sample'),
      ),
      body: Container(),
    );
  }
}
