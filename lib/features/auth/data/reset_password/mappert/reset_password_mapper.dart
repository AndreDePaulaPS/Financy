import 'package:flutter_finance_app/features/auth/data/reset_password/dto/reset_password_dto.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/input/reset_password_input.dart';

extension ResetPasswordMapper on ResetPasswordInput {
  ResetPasswordDto toDto(){
    return ResetPasswordDto(email: email);
  }
}