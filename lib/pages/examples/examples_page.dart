import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/examples/lifecycle/example_lifecycle_page.dart';
import 'package:flutter_sample/support/res/dimens.dart';
import 'package:flutter_sample/support/res/styles.dart';

import 'loading/example_loading_page.dart';

///
/// author: hefei
/// time  : 2020/12/14
/// desc  : example
///
class ExamplesPage extends StatefulWidget {
  @override
  _ExamplesPageState createState() => _ExamplesPageState();
}

class _ExamplesPageState extends State<ExamplesPage> {
  List<String> _list = ["Lifecycle", "LoadingLayout"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.0),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            _onItemTapped(index);
          },
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.icecream,
                  size: 36.0,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: Dimens.gap_dp10),
                Text(_list[index], style: TextStyles.gridTitle),
              ],
            ),
          ),
        );
      },
      itemCount: _list.length,
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        // Lifecycle
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return ExampleLifecyclePage();
        }));
        break;
      case 0:
        // LoadingLayout
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return ExampleLoadingPage();
        }));
        break;
    }
  }
}
