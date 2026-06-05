import 'package:dio/dio.dart';
import 'package:flutter_finance_app/shared/exception/app_exception.dart';
import 'package:flutter_finance_app/core/session/data/dto/session_dto.dart';
import 'package:flutter_finance_app/features/auth/data/login/dto/auth_request_dto.dart';
import 'package:flutter_finance_app/features/auth/domain/login/contract/i_auth_service.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class AuthServiceImpl implements IAuthService {
  final Dio _dio;

  AuthServiceImpl(this._dio);

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
