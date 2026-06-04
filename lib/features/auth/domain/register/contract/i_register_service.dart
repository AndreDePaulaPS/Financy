import 'package:flutter_finance_app/core/session/data/dto/session_dto.dart';
import 'package:flutter_finance_app/features/auth/data/register/dto/register_request_dto.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IRegisterService {

  Future<Result<SessionDto, Exception>> register(RegisterRequestDto registerDto);
}