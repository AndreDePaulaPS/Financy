import 'package:dio/dio.dart';
import 'package:flutter_finance_app/core/exception/app_exception.dart';
import 'package:flutter_finance_app/core/session/data/dto/session_dto.dart';
import 'package:flutter_finance_app/feature/auth/data/dto/auth_request_dto.dart';
import 'package:flutter_finance_app/feature/auth/domain/contract/i_auth_service.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class AuthService implements IAuthService {
  final Dio _dio;

  AuthService(this._dio);

  @override
  Future<Result<SessionDto, Exception>> login(AuthRequestDto auth) async {
    try {
      final response = await _dio.post("/auth/login", data: auth.toJson());

      if (response.statusCode == 200) {
        return Success(SessionDto.fromJson(response.data));
      }
      return Failure(AppException(mensagem: response.data));
    } on DioException catch (e) {
      return Failure(AppException(mensagem: e.toString()));
    }
  }
}
