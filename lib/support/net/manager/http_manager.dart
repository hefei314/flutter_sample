import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/support/net/exception/api_exception.dart';
import 'package:flutter_sample/support/net/interceptor/error_interceptor.dart';
import 'package:flutter_sample/support/net/mode/api_code.dart';

///请求成功回调
typedef OnSuccess<T> = void Function(dynamic data);

///请求失败回调
typedef OnError = void Function(ApiException exception);

///
/// author: hefei
/// time  : 2020/11/03
/// desc  : Dio封装
///
class HttpManager {
  Map<String, CancelToken> _cancelTokens = Map<String, CancelToken>();

  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  Dio _client;

  static HttpManager _instance = HttpManager._internal();

  factory HttpManager() => _instance;

  Dio get client => _client;

  HttpManager._internal() {
    if (_client == null) {
      BaseOptions options = BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );

      _client = Dio(options);

      _client.interceptors.add(ErrorInterceptor());
    }
  }

  /// 初始化公共属性
  ///
  /// [baseUrl]         地址前缀
  /// [connectTimeout]  连接超时赶时间
  /// [receiveTimeout]  接收超时赶时间
  /// [interceptors]    基础拦截器
  void init(
      {String baseUrl, int connectTimeout, int receiveTimeout, List<Interceptor> interceptors}) {
    _client.options = _client.options.merge(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      _client.interceptors..addAll(interceptors);
    }
  }

  ///
  /// GET
  ///
  void get({
    @required String url,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    @required String tag,
  }) async {
    // 检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onError != null) {
        onError(ApiException(ApiRequestCode.NETWORK_ERROR, "网络异常，请稍后重试！"));
      }
      return;
    }

    params = params ?? {};

    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.get(url,
          queryParameters: params, options: options, cancelToken: cancelToken);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      if (onError != null && e.type != DioErrorType.CANCEL) {
        onError(ApiException.dioError(e));
      }
    } catch (e) {
      if (e is TypeError) {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.PARSE_ERROR, "数据转换失败，请稍后重试！"));
        }
      } else {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.UNKNOWN, e.toString()));
        }
      }
    }
  }

  ///
  /// POST
  ///
  void post({
    @required String url,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    @required String tag,
  }) async {
    // 检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onError != null) {
        onError(ApiException(ApiRequestCode.NETWORK_ERROR, "网络异常，请稍后重试！"));
      }
      return;
    }

    params = params ?? {};

    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.post(url,
          data: data, queryParameters: params, options: options, cancelToken: cancelToken);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      if (onError != null && e.type != DioErrorType.CANCEL) {
        onError(ApiException.dioError(e));
      }
    } catch (e) {
      if (e is TypeError) {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.PARSE_ERROR, "数据转换失败，请稍后重试！"));
        }
      } else {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.UNKNOWN, e.toString()));
        }
      }
    }
  }

  ///
  /// PUT
  ///
  void put({
    @required String url,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    @required String tag,
  }) async {
    // 检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onError != null) {
        onError(ApiException(ApiRequestCode.NETWORK_ERROR, "网络异常，请稍后重试！"));
      }
      return;
    }

    params = params ?? {};

    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.put(url,
          data: data, queryParameters: params, options: options, cancelToken: cancelToken);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      if (onError != null && e.type != DioErrorType.CANCEL) {
        onError(ApiException.dioError(e));
      }
    } catch (e) {
      if (e is TypeError) {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.PARSE_ERROR, "数据转换失败，请稍后重试！"));
        }
      } else {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.UNKNOWN, e.toString()));
        }
      }
    }
  }

  ///
  /// DELETE
  ///
  void delete({
    @required String url,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    @required String tag,
  }) async {
    // 检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onError != null) {
        onError(ApiException(ApiRequestCode.NETWORK_ERROR, "网络异常，请稍后重试！"));
      }
      return;
    }

    params = params ?? {};

    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.delete(url,
          data: data, queryParameters: params, options: options, cancelToken: cancelToken);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      if (onError != null && e.type != DioErrorType.CANCEL) {
        onError(ApiException.dioError(e));
      }
    } catch (e) {
      if (e is TypeError) {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.PARSE_ERROR, "数据转换失败，请稍后重试！"));
        }
      } else {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.UNKNOWN, e.toString()));
        }
      }
    }
  }

  ///
  /// PATCH
  ///
  void patch({
    @required String url,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    @required String tag,
  }) async {
    // 检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onError != null) {
        onError(ApiException(ApiRequestCode.NETWORK_ERROR, "网络异常，请稍后重试！"));
      }
      return;
    }

    params = params ?? {};

    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.patch(url,
          data: data, queryParameters: params, options: options, cancelToken: cancelToken);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      if (onError != null && e.type != DioErrorType.CANCEL) {
        onError(ApiException.dioError(e));
      }
    } catch (e) {
      if (e is TypeError) {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.PARSE_ERROR, "数据转换失败，请稍后重试！"));
        }
      } else {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.UNKNOWN, e.toString()));
        }
      }
    }
  }

  ///
  /// DOWNLOAD
  ///
  void download({
    @required String url,
    @required savePath,
    ProgressCallback onReceiveProgress,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    @required String tag,
  }) async {
    // 检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onError != null) {
        onError(ApiException(ApiRequestCode.NETWORK_ERROR, "网络异常，请稍后重试！"));
      }
      return;
    }

    // 不设置超时时间
    int receiveTimeout = 0;
    options ??= options == null
        ? Options(receiveTimeout: receiveTimeout)
        : options.merge(receiveTimeout: receiveTimeout);

    params = params ?? {};

    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.download(url, savePath,
          onReceiveProgress: onReceiveProgress,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      if (onError != null && e.type != DioErrorType.CANCEL) {
        onError(ApiException.dioError(e));
      }
    } catch (e) {
      if (e is TypeError) {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.PARSE_ERROR, "数据转换失败，请稍后重试！"));
        }
      } else {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.UNKNOWN, e.toString()));
        }
      }
    }
  }

  ///
  /// UPLOAD
  ///
  void upload({
    @required String url,
    ProgressCallback onSendProgress,
    data,
    Map<String, dynamic> params,
    Options options,
    OnSuccess onSuccess,
    OnError onError,
    @required String tag,
  }) async {
    // 检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onError != null) {
        onError(ApiException(ApiRequestCode.NETWORK_ERROR, "网络异常，请稍后重试！"));
      }
      return;
    }

    params = params ?? {};

    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.post(url,
          onSendProgress: onSendProgress,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      if (onError != null && e.type != DioErrorType.CANCEL) {
        onError(ApiException.dioError(e));
      }
    } catch (e) {
      if (e is TypeError) {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.PARSE_ERROR, "数据转换失败，请稍后重试！"));
        }
      } else {
        if (onError != null) {
          onError(ApiException(ApiRequestCode.UNKNOWN, e.toString()));
        }
      }
    }
  }

  void cancel(String tag) {
    if (_cancelTokens.containsKey(tag)) {
      if (!_cancelTokens[tag].isCancelled) {
        _cancelTokens[tag].cancel();
      }
      _cancelTokens.remove(tag);
    }
  }
}
