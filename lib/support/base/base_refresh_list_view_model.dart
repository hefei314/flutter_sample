import 'dart:ui';

import 'package:flutter_sample/support/base/base_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
/// author: hefei
/// time  : 2020/12/24
/// desc  :
///
abstract class BaseRefreshListViewModel<T> extends BaseViewModel {
  int currentPage = 1;
  int currentPageCount = 1;

  List<T> list = [];

  RefreshController refreshController = RefreshController(initialRefresh: false);

  ///
  /// 加载数据
  ///
  void loadData();

  ///
  /// 加载更多数据
  ///
  void loadMoreData();

  ///
  /// 结果函数集，包含请求数据成功、请求更多数据成功、无数据、请求错误、无网络
  ///

  void loadDataSuccess(List<T> data) {
    viewState = ViewState.Success;
    refreshController.refreshCompleted();
    list.clear();
    list.addAll(data);
  }

  void loadMoreDataSuccess(List<T> data) {
    viewState = ViewState.Success;
    refreshController.loadComplete();
    list.addAll(data);
  }

  void loadMoreDataFailed({VoidCallback function}) {
    viewState = ViewState.Success;
    refreshController.loadFailed();
    function();
  }

  void noMoreData() {
    viewState = ViewState.Success;
    refreshController.loadNoData();
  }

  void empty() {
    viewState = ViewState.Empty;
    refreshController.refreshCompleted();
  }

  void error({VoidCallback function}) {
    viewState = ViewState.Error;
    refreshController.refreshFailed();
    function();
  }

  void noNetwork({VoidCallback function}) {
    viewState = ViewState.NoNetwork;
    refreshController.refreshFailed();
    function();
  }
}
