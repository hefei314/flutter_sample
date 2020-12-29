import 'package:flutter/material.dart';
import 'package:flutter_sample/support/res/styles.dart';
import 'package:flutter_sample/support/route/navigator_util.dart';
import 'package:flutter_sample/support/route/routes.dart';

///
/// author: hefei
/// time  : 2020/12/14
/// desc  : basic
///
class WidgetsPage extends StatefulWidget {
  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _buildElement(),
          _buildLayout(),
          _buildComponent(),
          _buildFunction(),
        ],
      ),
    );
  }

  Widget _buildItem(String text, String routeName) {
    return ListTile(
      title: Text(text),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        NavigatorUtil.goPage(context, routeName);
      },
    );
  }

  Widget _buildElement() {
    return ExpansionTile(
      title: Text("Element"),
      children: <Widget>[
        _buildItem("Icon", Routes.widgetsElementIcon),
        _buildItem("Text", Routes.widgetsElementText),
        _buildItem("Image", Routes.widgetsElementImage),
        _buildItem("Button", Routes.widgetsElementButton),
        _buildItem("TextField", Routes.widgetsElementTextField),
        _buildItem("Radio", Routes.widgetsElementRadio),
        _buildItem("Switch", Routes.widgetsElementSwitch),
        _buildItem("Checkbox", Routes.widgetsElementCheckbox),
      ],
    );
  }

  Widget _buildLayout() {
    return ExpansionTile(
      title: Text("Layout"),
      children: <Widget>[
        _buildItem("Stack", Routes.widgetsStack),
      ],
    );
  }

  Widget _buildComponent() {
    return ExpansionTile(
      title: Text("Component"),
      children: <Widget>[
        _buildItem("Card", Routes.widgetsCard),
        _buildItem("Drawer", Routes.widgetsDrawer),
        _buildItem("TabBar", Routes.widgetsTabBar),
        _buildItem("ListView", Routes.widgetsListView),
        _buildItem("GridView", Routes.widgetsGridView),
        _buildItem("BottomNavigationBar", Routes.widgetsBottomNavigationBar),
      ],
    );
  }

  Widget _buildFunction() {
    return ExpansionTile(
      title: Text("Function"),
      children: <Widget>[
        _buildItem("Dialog", Routes.widgetsDialog),
      ],
    );
  }
}
