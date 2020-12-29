import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///
/// author: hefei
/// time  : 2020/12/28
/// desc  : 执行顺序：
///         createState ==> initState ==> didChangeDependencies ==> build ==> addPostFrameCallback ==> didUpdateWidget ==> deactivate ==> dispose
///
class ExampleLifecyclePage extends StatefulWidget {
  @override
  _ExampleLifecyclePageState createState() => _ExampleLifecyclePageState();
}

class _ExampleLifecyclePageState extends State<ExampleLifecyclePage> with WidgetsBindingObserver {
  ///
  /// 当插入渲染树的时候调用，这个函数在生命周期中只调用一次。
  ///
  @override
  void initState() {
    print('ExampleLifecyclePage: initState');
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // 渲染结束时回调
    SchedulerBinding.instance.addPostFrameCallback((_) => {});
  }

  ///
  /// 在widget重新构建时，检测Widget.canUpdate是否为true，是则调用该回调
  ///
  @override
  void didUpdateWidget(ExampleLifecyclePage oldWidget) {
    print('ExampleLifecyclePage: didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  ///
  /// 当要将 State 对象从渲染树中移除时
  ///
  @override
  void deactivate() {
    print('ExampleLifecyclePage: deactivate');
    super.deactivate();
  }

  ///
  /// 销毁
  ///
  @override
  void dispose() {
    print('ExampleLifecyclePage: dispose');
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  ///
  /// 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
  ///
  @override
  void reassemble() {
    print('ExampleLifecyclePage: reassemble');
    super.reassemble();
  }

  ///
  /// 1.initState()执行后调用
  /// 2.InheritedWidget发生变化时调用
  ///
  @override
  void didChangeDependencies() {
    print('ExampleLifecyclePage: didChangeDependencies');
    super.didChangeDependencies();
  }

  ///
  /// APP生命周期 resumed inactive paused suspending
  ///
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('ExampleLifecyclePage: didChangeAppLifecycleState ${state.toString()}');
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    print('ExampleLifecyclePage: build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NextPage();
          }));
        },
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  void initState() {
    print('NextPage: initState');
    super.initState();
  }

  @override
  void didUpdateWidget(NextPage oldWidget) {
    print('NextPage: didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('NextPage: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('NextPage: dispose');
    super.dispose();
  }

  @override
  void reassemble() {
    print('NextPage: reassemble');
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    print('NextPage: didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('NextPage: build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle-NextPage"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.keyboard_return),
        tooltip: "返回",
      ),
    );
  }
}
