import 'package:flutter_finance_app/core/session/data/dto/session_dto.dart';
import 'package:flutter_finance_app/features/auth/data/login/dto/auth_request_dto.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IAuthService {

  Future<Result<SessionDto, Exception>> login(AuthRequestDto auth);
}