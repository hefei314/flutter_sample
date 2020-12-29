import 'package:flutter_sample/support/base/base_refresh_list_view_model.dart';
import 'package:flutter_sample/support/bean/article_bean.dart';
import 'package:flutter_sample/support/bean/base_data.dart';
import 'package:flutter_sample/support/net/http_utils.dart';
import 'package:flutter_sample/support/net/mode/api_code.dart';

///
/// author: hefei
/// time  : 2020/12/24
/// desc  :
///
class ExampleLoadingViewModel extends BaseRefreshListViewModel<ArticleBean> {
  @override
  void loadData() {
    HttpUtils.get(
      url: "data/category/GanHuo/type/Android/page/1/count/20",
      onSuccess: (data) {
        print(data);
        BaseData<List<ArticleBean>> ganHuo = BaseData.fromJson(data);
        if (ganHuo.status == 100) {
          if (ganHuo.data != null && ganHuo.data.isNotEmpty) {
            loadDataSuccess(ganHuo.data);
            currentPage = ganHuo.page;
            currentPageCount = ganHuo.pageCount;
          } else {
            empty();
          }
        } else {
          error();
        }
      },
      onError: (e) {
        if (e.code == ApiRequestCode.NETWORK_ERROR) {
          noNetwork();
        } else {
          error();
        }
      },
    );
  }

  @override
  void loadMoreData() {
    currentPage++;
    if (currentPage >= 1 && currentPage <= currentPageCount) {
      HttpUtils.get(
        url: "data/category/GanHuo/type/Android/page/$currentPage/count/10",
        onSuccess: (data) {
          print(data);
          BaseData<List<ArticleBean>> ganHuo = BaseData.fromJson(data);
          if (ganHuo.status == 100) {
            if (ganHuo.data != null && ganHuo.data.isNotEmpty) {
              loadMoreDataSuccess(ganHuo.data);
            } else {
              noMoreData();
            }
          } else {
            loadMoreDataFailed();
          }
        },
        onError: (e) {
          loadMoreDataFailed();
        },
      );
    } else {
      noMoreData();
    }
  }
}
