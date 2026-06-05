import 'package:dio/dio.dart';
import 'package:flutter_finance_app/features/auth/data/reset_password/dto/reset_password_dto.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/contract/i_reset_password_service.dart';
import 'package:flutter_finance_app/shared/exception/app_exception.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class ResetPasswordServiceImpl implements IResetPasswordService{
  final Dio _dio;
  
  ResetPasswordServiceImpl(this._dio);

  @override
  Future<Result<void, Exception>> resetPassword(ResetPasswordDto reset) async {
    try{
      final response = await _dio.post("/auth/reset-password", data: reset.toJson());
      if(response.statusCode == 200){
        return Success(null);
      }
      return Failure(AppException(mensagem: response.data));
    } on DioException catch (e){
      return Failure(AppException(mensagem: e.toString()));
    }
  }
}