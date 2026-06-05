import 'package:flutter_finance_app/features/auth/data/reset_password/dto/reset_password_dto.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IResetPasswordService {
  Future<Result<void, Exception>> resetPassword(ResetPasswordDto reset);
}