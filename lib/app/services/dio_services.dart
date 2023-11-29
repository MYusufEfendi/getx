import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'logging.dart';

class DioClient {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(Logging());
    _dio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: 30.seconds,
      receiveTimeout: 30.seconds,
    );
    _dio.options.baseUrl = "https://reqres.in/api";
    return _dio;
  }
}
