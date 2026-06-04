import 'package:flutter_finance_app/feature/auth/data/register/dto/register_request_dto.dart';
import 'package:flutter_finance_app/feature/auth/domain/register/input/register_input.dart';

extension RegisterMapper on RegisterInput {
  RegisterRequestDto toDto() {
    return RegisterRequestDto(
      email: email,
      password: password,
      name: name,
      confirmPassword: confirmPassword,
    );
  }
}
