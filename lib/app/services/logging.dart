import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getx_test/app/util/function/snackbars.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    debugPrint(
      'REQUEST[${options.data}] ',
    );
    debugPrint(
      'URL [${options.uri}] ',
    );
    debugPrint(
      'REQUEST[${options.headers}] ',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response.toString() == "null") {
      SnackBars.flatSnackBar("Pastikan koneksi internet anda stabil");
    }
    return super.onError(err, handler);
  }
}
