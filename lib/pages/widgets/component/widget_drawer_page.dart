import 'package:flutter/material.dart';

///
/// author: hefei
/// time  : 2020/12/28
/// desc  : the example for Drawer
///         focus: you can push to new page or change body directly
///
class WidgetDrawerPage extends StatefulWidget {
  @override
  _WidgetDrawerPageState createState() => _WidgetDrawerPageState();
}

class _WidgetDrawerPageState extends State<WidgetDrawerPage> {
  int _selectedIndex = 0;
  var _pageList = [WidgetDrawerHomePage(), WidgetDrawerSettingPage(), WidgetDrawerAccountPage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      body: _pageList[_selectedIndex],
      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("DrawerHeader"),
              ),
              ListTile(
                leading: new Icon(Icons.home),
                title: new Text("Home"),
                onTap: () {
                  switchPage(0);
                },
              ),
              ListTile(
                leading: new Icon(Icons.settings),
                title: new Text("Setting"),
                onTap: () {
                  switchPage(1);
                },
              ),
              ListTile(
                leading: new Icon(Icons.account_box),
                title: new Text("Account"),
                onTap: () {
                  switchPage(2);
                },
              ),
              AboutListTile(
                child: Text("About"),
                applicationName: "flutter_sample",
                applicationVersion: "v1.0.0",
                applicationIcon: Icon(Icons.adb),
                icon: Icon(Icons.info),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void switchPage(int index) {
    Navigator.of(context).pop();
    setState(() {
      _selectedIndex = index;
    });
  }
}

class WidgetDrawerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Center(
        child: Text("Home"),
      ),
    );
  }
}

class WidgetDrawerSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Text("Setting"),
      ),
    );
  }
}

class WidgetDrawerAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      child: Center(
        child: Text("Account"),
      ),
    );
  }
}
