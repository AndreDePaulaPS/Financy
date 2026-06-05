import 'package:flutter_finance_app/features/auth/domain/reset_password/input/reset_password_input.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IResetPasswordRepository {
  Future<Result<void, Exception>> resetPassword(ResetPasswordInput reset);
}
