import 'package:flutter/material.dart';
import 'package:flutter_sample/support/res/styles.dart';
import 'package:flutter_sample/widgets/loading_layout.dart';

///
/// author: hefei
/// time  : 2020/12/14
/// desc  : example: 多状态布局
///
class ExampleLoadingPage extends StatefulWidget {
  @override
  _ExampleLoadingPageState createState() => _ExampleLoadingPageState();
}

class _ExampleLoadingPageState extends State<ExampleLoadingPage> {
  LoadingState _loadingState = LoadingState.State_Loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoadingLayout'),
      ),
      body: LoadingLayout(
        state: _loadingState,
        contentView: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('11111111111'),
            );
          },
          itemCount: 30,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Gaps.vGap10,
          FloatingActionButton(
            heroTag: 'state_success',
            onPressed: () {
              _changeLoadingState(LoadingState.State_Success);
            },
            child: Text('成功'),
          ),
          Gaps.vGap10,
          FloatingActionButton(
            heroTag: 'state_empty',
            onPressed: () {
              _changeLoadingState(LoadingState.State_Empty);
            },
            child: Text('无数据'),
          ),
          Gaps.vGap10,
          FloatingActionButton(
            heroTag: 'state_error',
            onPressed: () {
              _changeLoadingState(LoadingState.State_Error);
            },
            child: Text('有错误'),
          ),
          Gaps.vGap10,
          FloatingActionButton(
            heroTag: 'state_no_network',
            onPressed: () {
              _changeLoadingState(LoadingState.State_No_Network);
            },
            child: Text('无网络'),
          ),
          Gaps.vGap10,
          FloatingActionButton(
            heroTag: 'state_loading',
            onPressed: () {
              _changeLoadingState(LoadingState.State_Loading);
            },
            child: Text('加载中'),
          )
        ],
      ),
    );
  }

  void _changeLoadingState(LoadingState loadingState) {
    setState(() {
      _loadingState = loadingState;
    });
  }
}
