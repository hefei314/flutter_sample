import 'package:flutter/material.dart';
import 'package:flutter_sample/support/res/dimens.dart';

enum LoadingState { Success, Empty, Error, NoNetwork, Loading }

///
/// author: hefei
/// time  : 2020/12/11
/// desc  : 多状态布局，包含加载中、无数据、出错、无网络四种状态
///
class LoadingLayout extends StatefulWidget {
  LoadingLayout(
      {Key key,
      this.state: LoadingState.Loading,
      this.emptyView,
      this.errorView,
      this.loadingView,
      this.contentView,
      this.noNetworkView,
      this.emptyRetry,
      this.errorRetry})
      : super(key: key);

  final LoadingState state;

  final Widget emptyView;
  final Widget errorView;
  final Widget loadingView;
  final Widget contentView;
  final Widget noNetworkView;

  final VoidCallback emptyRetry;
  final VoidCallback errorRetry;

  @override
  _LoadingLayoutState createState() => _LoadingLayoutState();
}

class _LoadingLayoutState extends State<LoadingLayout> {
  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }

  Widget _buildWidget() {
    switch (widget.state) {
      case LoadingState.Empty:
        return widget.emptyView ?? _buildEmptyView();
        break;
      case LoadingState.Error:
        return widget.errorView ?? _buildErrorView();
        break;
      case LoadingState.Loading:
        return widget.loadingView ?? _buildLoadingView();
        break;
      case LoadingState.Success:
        return widget.contentView;
        break;
      case LoadingState.NoNetwork:
        return widget.noNetworkView ?? _buildNoNetworkView();
        break;
      default:
        return Container();
    }
  }

  Widget _buildLoadingView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: Dimens.gap_dp20),
            Text('拼命加载中...', style: TextStyle(fontSize: Dimens.font_sp16))
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: InkWell(
        onTap: widget.emptyRetry,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.airplay,
                size: 40.0,
                color: Colors.black38,
              ),
            ),
            SizedBox(height: Dimens.gap_dp20),
            Text('暂无相关数据, 轻触重试~', style: TextStyle(fontSize: Dimens.font_sp16))
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: InkWell(
        onTap: widget.errorRetry,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.error,
                size: 40.0,
                color: Colors.black38,
              ),
            ),
            SizedBox(height: Dimens.gap_dp20),
            Text('加载失败, 轻触重试~', style: TextStyle(fontSize: Dimens.font_sp16))
          ],
        ),
      ),
    );
  }

  Widget _buildNoNetworkView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: InkWell(
        onTap: widget.errorRetry,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.network_check,
                size: 40.0,
                color: Colors.black38,
              ),
            ),
            SizedBox(height: Dimens.gap_dp20),
            Text('加载失败, 轻触重试~', style: TextStyle(fontSize: Dimens.font_sp16))
          ],
        ),
      ),
    );
  }
}
