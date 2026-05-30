import 'package:dio/dio.dart';
import 'package:flutter_finance_app/core/network/auth_interceptor.dart';

class AppHttpClient {
  Dio _dio;

  Dio get dio => _dio;

  AppHttpClient(this._dio, AuthInterceptor interceptor){
    _dio = Dio(_configBase());
    _dio.interceptors.add(interceptor);
  }


  BaseOptions _configBase(){
    return BaseOptions(
      baseUrl: "http://10.0.2.2:3000",
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5)
    );
  }
}