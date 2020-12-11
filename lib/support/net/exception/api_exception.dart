import 'package:dio/dio.dart';
import 'package:flutter_sample/support/net/mode/api_code.dart';

///
/// author: hefei
/// time  : 2020/11/03
/// desc  : 异常处理
///
class ApiException {
  int code;

  String message;

  ApiException(this.code, this.message);

  ApiException.dioError(DioError error) {
    message = error.message;
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        code = ApiRequestCode.CONNECT_TIMEOUT;
        message = "网络连接超时，请检查网络设置！";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        code = ApiRequestCode.RECEIVE_TIMEOUT;
        message = "网络响应超时，请稍后重试！";
        break;
      case DioErrorType.SEND_TIMEOUT:
        code = ApiRequestCode.SEND_TIMEOUT;
        message = "网络请求超时，请稍后重试！";
        break;
      case DioErrorType.RESPONSE:
        code = ApiRequestCode.HTTP_ERROR;
        switch (error.response.statusCode) {
          case ApiHttpCode.UNAUTHORIZED:
          case ApiHttpCode.FORBIDDEN:
          case ApiHttpCode.NOT_FOUND:
            message = "没有权限，请稍后重试！";
            break;
          case ApiHttpCode.REQUEST_TIMEOUT:
            message = "网络请求超时，请稍后重试！";
            break;
          case ApiHttpCode.INTERNAL_SERVER_ERROR:
          case ApiHttpCode.BAD_GATEWAY:
          case ApiHttpCode.SERVICE_UNAVAILABLE:
          case ApiHttpCode.GATEWAY_TIMEOUT:
            message = "服务器异常，请稍后重试！";
            break;
          default:
            message = "服务器异常，请稍后重试！";
            break;
        }
        break;
      case DioErrorType.CANCEL:
        code = ApiRequestCode.CANCEL;
        message = "请求已被取消，请重新请求！";
        break;
      case DioErrorType.DEFAULT:
        code = ApiRequestCode.UNKNOWN;
        message = "网络异常，请稍后重试！";
        break;
    }
  }

  @override
  String toString() {
    return 'ApiException{code: $code, message: $message}';
  }
}
