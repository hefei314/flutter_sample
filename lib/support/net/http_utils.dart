import 'package:dio/dio.dart';
import 'package:flutter_sample/support/net/manager/http_manager.dart';

///
/// author: hefei
/// time  : 2020/12/11
/// desc  : 网络请求工具类
///
class HttpUtils {
  static void init({
    String baseUrl,
    int connectTimeout,
    int receiveTimeout,
    List<Interceptor> interceptors,
  }) {
    HttpManager().init(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        interceptors: interceptors);
  }

  static void cancelRequest(String tag) {
    HttpManager().cancel(tag);
  }

  static void get({
    String url,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    String tag,
  }) async {
    return HttpManager().get(
      url: url,
      params: params,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
      tag: tag,
    );
  }

  static void post({
    String url,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    String tag,
  }) async {
    return HttpManager().post(
      url: url,
      data: data,
      params: params,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
      tag: tag,
    );
  }

  static void put({
    String url,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    String tag,
  }) async {
    return HttpManager().put(
      url: url,
      data: data,
      params: params,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
      tag: tag,
    );
  }

  static void patch({
    String url,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    String tag,
  }) async {
    return HttpManager().patch(
      url: url,
      data: data,
      params: params,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
      tag: tag,
    );
  }

  static void download({
    String url,
    savePath,
    ProgressCallback onReceiveProgress,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    String tag,
  }) async {
    return HttpManager().download(
      url: url,
      savePath: savePath,
      onReceiveProgress: onReceiveProgress,
      data: data,
      params: params,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
      tag: tag,
    );
  }

  static void upload({
    String url,
    ProgressCallback onSendProgress,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    String tag,
  }) async {
    return HttpManager().upload(
      url: url,
      onSendProgress: onSendProgress,
      data: data,
      params: params,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
      tag: tag,
    );
  }
}
