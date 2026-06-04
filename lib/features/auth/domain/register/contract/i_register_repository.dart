import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/features/auth/domain/register/input/register_input.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IRegisterRepository {
  Future<Result<Session, Exception>> register(RegisterInput registerInput);
}