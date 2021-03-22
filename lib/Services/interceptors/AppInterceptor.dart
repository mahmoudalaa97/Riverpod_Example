import 'package:dio/dio.dart';

import '../constant.dart';

/// APP Interceptor
/// This Interceptor handle error and response request for each dio request
class AppInterceptors extends Interceptor {
  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    return super.onResponse(response);
  }

  @override
  Future onRequest(RequestOptions options) {
    /// BaseUrl for API
    options.baseUrl = ServicesConstant.baseUrl;

    /// Create Time out for sending
    options.sendTimeout = 15 * 1000;

    /// Create Time out for Connect
    options.connectTimeout = 10 * 1000;

    /// Redirects true
    options.followRedirects = true;

    /// Add Header Accepted
    options.headers.addAll({
      Headers.acceptHeader: "application/json",
      Headers.contentTypeHeader: "application/json"
    });
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    // TODO: implement onError
    return super.onError(err);
  }
}
