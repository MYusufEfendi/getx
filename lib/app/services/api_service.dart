import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:getx_test/app/data/users_model.dart';

class ApiService {
  final Dio _client;

  ApiService(this._client);

  Future<dynamic> register({required email, required password}) async {
    dynamic res;
    try {
      Response response = await _client
          .post("/register", data: {'email': email, 'password': password});
      res = response.data;
    } on DioException catch (e) {
      res = e.response?.data;
      debugPrint("  DioException catch $res");
    }
    return res;
  }

  Future<dynamic> login({required email, required password}) async {
    dynamic res;
    try {
      Response response = await _client
          .post("/login", data: {'email': email, 'password': password});
      res = response.data;
    } on DioException catch (e) {
      res = e.response?.data;
      debugPrint("  DioException catch $res");
    }
    return res;
  }

  Future<UsersModel?> getUsers() async {
    UsersModel? res;
    try {
      Response response = await _client.get("/users");
      res = UsersModel.fromJson(response.data);
    } on DioException catch (e) {
      res = e.response?.data;
      debugPrint("  DioException catch $res");
    }
    return res;
  }
}
