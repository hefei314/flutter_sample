import 'dart:ui';

import 'package:flutter_sample/support/base/base_view_model.dart';

///
/// author: hefei
/// time  : 2020/12/24
/// desc  :
///
abstract class BaseBeanViewModel<T> extends BaseViewModel {
  T data;

  ///
  /// 加载数据
  ///
  void loadData();

  ///
  /// 结果函数集，包含请求数据成功、无数据、请求错误、无网络
  ///

  void success(T data) {
    viewState = ViewState.Success;
    this.data = data;
  }

  void empty() {
    viewState = ViewState.Empty;
  }

  void error({VoidCallback function}) {
    viewState = ViewState.Error;
    function();
  }

  void noNetwork({VoidCallback function}) {
    viewState = ViewState.NoNetwork;
    function();
  }
}
