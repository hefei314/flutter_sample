import 'package:flutter_sample/support/bean/article_bean.dart';
import 'package:flutter_sample/support/bean/splash_bean.dart';
import 'package:flutter_sample/support/bean/user_info.dart';

///
/// author: hefei
/// time  : 2020/10/26
/// desc  :
///
class BaseData<T> {
  BaseData({this.status, this.data, this.page, this.pageCount, this.totalCounts});

  int status;
  T data;

  int page;
  int pageCount;
  int totalCounts;

  BaseData.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    if (json["data"] != null && json['data'] != "null") {
      this.data = fromJsonAsT<T>(json['data']);
    }
    this.page = json["page"];
    this.pageCount = json["page_count"];
    this.totalCounts = json["total_counts"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    if (this.data != null) {
      data["data"] = this.data;
    }
    data["page"] = this.page;
    data["pageCount"] = this.pageCount;
    data["totalCounts"] = this.totalCounts;
    return data;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList.add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }

  static _getListFromType(String type) {
    switch (type) {
      case 'SplashBean':
        return List<SplashBean>();
      case 'UserInfo':
        return List<UserInfo>();
      case 'ArticleBean':
        return List<ArticleBean>();
    }
    return null;
  }

  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'SplashBean':
        return SplashBean.fromJson(json);
      case 'UserInfo':
        return UserInfo.fromJson(json);
      case 'ArticleBean':
        return ArticleBean.fromJson(json);
    }
    return null;
  }
}
