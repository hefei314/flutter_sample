///
/// author: hefei
/// time  : 2020/11/03
/// desc  :
///
class ApiHttpCode {
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;
}

class ApiRequestCode {
  ///未知错误
  static const int UNKNOWN = 1000;

  ///解析错误
  static const int PARSE_ERROR = 1001;

  ///网络错误
  static const int NETWORK_ERROR = 1002;

  ///协议错误
  static const int HTTP_ERROR = 1003;

  ///证书错误
  static const int SSL_ERROR = 1005;

  ///连接超时
  static const int CONNECT_TIMEOUT = 1006;

  ///响应超时
  static const int RECEIVE_TIMEOUT = 1007;

  ///发送超时
  static const int SEND_TIMEOUT = 1008;

  ///网络请求取消
  static const int CANCEL = 1009;
}
