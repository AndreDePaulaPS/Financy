import 'package:dio/dio.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';

class AuthInterceptor extends Interceptor {
  final ISessionManager _sessionManager;

  AuthInterceptor(this._sessionManager);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final session = _sessionManager.loadSession();

    final token = session?.token;

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
