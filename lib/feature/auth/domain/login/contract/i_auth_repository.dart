import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/feature/auth/domain/login/input/login_input.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IAuthRepository {
  Future<Result<Session, Exception>> login(LoginInput auth);
}