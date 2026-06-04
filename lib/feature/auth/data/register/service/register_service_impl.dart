import 'package:dio/dio.dart';
import 'package:flutter_finance_app/core/session/data/dto/session_dto.dart';
import 'package:flutter_finance_app/feature/auth/data/register/dto/register_request_dto.dart';
import 'package:flutter_finance_app/feature/auth/domain/register/contract/i_register_service.dart';
import 'package:flutter_finance_app/shared/exception/app_exception.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class RegisterServiceImpl implements IRegisterService {
  final Dio _dio;

  RegisterServiceImpl(this._dio);

  @override
  Future<Result<SessionDto, Exception>> register(
    RegisterRequestDto registerDto,
  ) async {
    try {
      final response = await _dio.post(
        "/auth/register",
        data: registerDto.toJson(),
      );
      if (response.statusCode == 200) {
        final sessionDto = SessionDto.fromJson(response.data);
        return Success(sessionDto);
      }

      return Failure(AppException(mensagem: response.data));
    } on DioException catch (_) {
      return Failure(AppException(mensagem: "Oops, Something went wrong!"));
    }
  }
}
