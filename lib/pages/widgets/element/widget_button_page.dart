import 'package:flutter/material.dart';

///
/// author: hefei
/// time  : 2020/12/28
/// desc  :
///
class WidgetButtonPage extends StatefulWidget {
  @override
  _WidgetButtonPageState createState() => _WidgetButtonPageState();
}

class _WidgetButtonPageState extends State<WidgetButtonPage> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Button"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ///
                /// RaisedButton
                ///
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'RaisedButton',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Wrap(
                  children: [
                    RaisedButton(
                      disabledColor: Colors.grey,
                      onPressed: null,
                      child: Text('disabled'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('normal'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Text('normal'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text('gradient'),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RaisedButton.icon(onPressed: () {}, icon: Icon(Icons.send), label: Text('发送')),
                  ],
                ),

                ///
                /// FlatButton
                ///
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'FlatButton',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Wrap(
                  children: [
                    FlatButton(
                      onPressed: null,
                      child: Text('disabled'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('normal'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    FlatButton(
                      onPressed: () {},
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Text('normal'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    FlatButton.icon(onPressed: () {}, icon: Icon(Icons.add), label: Text('添加')),
                  ],
                ),

                ///
                /// OutlineButton
                ///
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'OutlineButton',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Wrap(
                  children: [
                    OutlineButton(
                      onPressed: null,
                      child: Text('disabled'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    OutlineButton(
                      onPressed: () {},
                      child: Text('normal'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    OutlineButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Text('normal'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    OutlineButton.icon(
                        onPressed: () {}, icon: Icon(Icons.details), label: Text('详情')),
                  ],
                ),

                ///
                /// IconButton
                ///
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'IconButton',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Wrap(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up),
                    tooltip: '点赞',
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      icon: Icon(Icons.thumb_up),
                      tooltip: '点赞',
                    ),
                  ),
                ]),

                ///
                /// other buttons
                ///
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'other buttons',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Wrap(
                  children: [
                    TextButton(onPressed: () {}, child: Text('normal')),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('normal')),
                    SizedBox(
                      width: 10.0,
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Three', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
