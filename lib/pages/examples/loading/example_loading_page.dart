import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/support/utils/other_util.dart';
import 'package:flutter_sample/widgets/loading_layout.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'example_loading_view_model.dart';

///
/// author: hefei
/// time  : 2020/12/14
/// desc  : example: 多状态布局\
///       问题:
///       1. LoadingLayout和SmartRefresher的层次关系
///
class ExampleLoadingPage extends StatefulWidget {
  @override
  _ExampleLoadingPageState createState() => _ExampleLoadingPageState();
}

class _ExampleLoadingPageState extends State<ExampleLoadingPage> {
  ExampleLoadingViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ExampleLoadingViewModel();
    _viewModel.loadData();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _viewModel),
      ],
      child: Consumer<ExampleLoadingViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('LoadingLayout'),
            ),
            body: LoadingLayout(
              state: OtherUtil.getLoadingState(viewModel.viewState),
              contentView: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: MaterialClassicHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("上拉加载");
                    } else if (mode == LoadStatus.loading) {
                      body = CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("加载失败！点击重试！");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("松手,加载更多!");
                    } else {
                      body = Text("没有更多数据了!");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                onRefresh: viewModel.loadData,
                onLoading: viewModel.loadMoreData,
                controller: viewModel.refreshController,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(viewModel.list[index].title),
                    );
                  },
                  itemCount: viewModel.list.length,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
