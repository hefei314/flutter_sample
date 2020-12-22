import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/basic/basic_page.dart';
import 'package:flutter_sample/pages/example/example_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// author: hefei
/// time  : 2020/12/11
/// desc  : 主页面
///
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Sample"),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Tab>[
              Tab(
                text: "Basic",
              ),
              Tab(
                text: "Example",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            BasicPage(),
            ExamplePage(),
          ],
        ),
      ),
      onWillPop: _doubleClickBack,
    );
  }

  DateTime _lastPressedAt;

  Future<bool> _doubleClickBack() {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
      Fluttertoast.showToast(
          msg: "再按一次退出程序", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
      _lastPressedAt = DateTime.now();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
