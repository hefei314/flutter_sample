import 'package:flutter/material.dart';

///
/// author: hefei
/// time  : 2020/12/28
/// desc  : the example for BottomNavigationBar
///         it's can not switch tab by slide
///
class WidgetBottomNavigationBarPage extends StatefulWidget {
  @override
  _WidgetBottomNavigationBarPageState createState() => _WidgetBottomNavigationBarPageState();
}

class _WidgetBottomNavigationBarPageState extends State<WidgetBottomNavigationBarPage> {
  int _selectedIndex = 0;
  var _pageList;

  @override
  void initState() {
    super.initState();
    _pageList = [
      Center(
        child: Text("Home"),
      ),
      Center(
        child: Text("Business"),
      ),
      Center(
        child: Text("School"),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BottomNavigationBar"),
        ),
        body: _pageList[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          ],
          fixedColor: Theme.of(context).primaryColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
