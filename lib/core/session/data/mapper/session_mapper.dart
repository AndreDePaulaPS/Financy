import 'package:flutter_finance_app/core/session/data/dto/session_dto.dart';
import 'package:flutter_finance_app/core/session/data/mapper/user_session_mapper.dart';
import 'package:flutter_finance_app/core/session/domain/entitie/session.dart';

extension SessionDtoMapper on SessionDto {
  Session toDomain() {
    return Session(
      token: token,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
      user: user.toDomain(),
    );
  }
}

extension SessionEntityMapper on Session {
  SessionDto toDto() {
    return SessionDto(
      token: token,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
      user: user.toDto(),
    );
  }
}