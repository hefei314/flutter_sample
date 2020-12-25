import 'package:flutter_sample/support/base/base_view_model.dart';

///
/// author: hefei
/// time  : 2020/12/24
/// desc  :
///
abstract class BaseListViewModel<T> extends BaseViewModel {
  List<T> list = [];

  void success(List<T> data) {
    viewState = ViewState.Success;
    list.clear();
    list.addAll(data);
  }
}
