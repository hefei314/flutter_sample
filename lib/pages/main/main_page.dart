import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/basic/basic_page.dart';
import 'package:flutter_sample/pages/example/example_page.dart';

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
  int _selectedIndex = 0;
  var _pageList;

  @override
  void initState() {
    super.initState();
    _pageList = [BasicPage(), ExamplePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Sample'),
      ),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.layers_rounded), label: 'Basic'),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Example'),
        ],
        fixedColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
