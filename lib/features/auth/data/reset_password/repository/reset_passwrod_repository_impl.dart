
import 'package:flutter_finance_app/features/auth/data/reset_password/mappert/reset_password_mapper.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/contract/i_reset_password_repository.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/contract/i_reset_password_service.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/input/reset_password_input.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class ResetPasswrodRepositoryImpl implements IResetPasswordRepository{
  final IResetPasswordService _resetPasswordService;

  ResetPasswrodRepositoryImpl(this._resetPasswordService);

  @override
  Future<Result<void, Exception>> resetPassword(ResetPasswordInput reset) async {
    return await _resetPasswordService.resetPassword(reset.toDto());  
  }

  
}