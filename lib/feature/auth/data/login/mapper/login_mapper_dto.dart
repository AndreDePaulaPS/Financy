import 'package:flutter_finance_app/feature/auth/data/login/dto/auth_request_dto.dart';
import 'package:flutter_finance_app/feature/auth/domain/login/input/login_input.dart';

extension LoginMapperDto on LoginInput {
  AuthRequestDto toDto() {
    return AuthRequestDto(email: email, password: password);
  }
}