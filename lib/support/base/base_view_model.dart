import 'package:flutter/cupertino.dart';

enum ViewState { Success, Empty, Error, NoNetwork, Loading }

///
/// author: hefei
/// time  : 2020/12/24
/// desc  : ViewModel基类
///         1.在页面中dispose()方法中手动调用ViewModel的dispose()方法
///
abstract class BaseViewModel extends ChangeNotifier {
  /// 防止页面销毁后，异步任务才完成，导致报错
  bool _disposed = false;

  /// 当前页面状态
  ViewState _viewState;

  ViewState get viewState => _viewState;

  set viewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
