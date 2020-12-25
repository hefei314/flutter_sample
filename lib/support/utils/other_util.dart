import 'package:flutter_sample/support/base/base_view_model.dart';
import 'package:flutter_sample/widgets/loading_layout.dart';

///
/// author: hefei
/// time  : 2020/12/24
/// desc  :
///
class OtherUtil {
  ///
  /// 框架页面状态及LoadingLayout页面状态的转换
  ///
  static LoadingState getLoadingState(ViewState viewState) {
    switch (viewState) {
      case ViewState.Success:
        return LoadingState.Success;
        break;
      case ViewState.Empty:
        return LoadingState.Empty;
        break;
      case ViewState.Error:
        return LoadingState.Error;
        break;
      case ViewState.NoNetwork:
        return LoadingState.NoNetwork;
        break;
      case ViewState.Loading:
        return LoadingState.Loading;
        break;
      default:
        return LoadingState.Loading;
        break;
    }
  }
}
