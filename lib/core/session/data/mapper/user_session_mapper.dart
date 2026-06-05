import 'package:flutter_finance_app/core/session/data/dto/user_session_dto.dart';
import 'package:flutter_finance_app/core/session/domain/entitie/user_session.dart';

extension UserSessionDtoMapper on UserSessionDto {
  UserSession toDomain() {
    return UserSession(
      id: id,
      name: name,
      email: email,
      avatarUrl: avatarUrl,
      premium: premium,
      roles: roles,
    );
  }
}

extension UserSessionEntityMapper on UserSession {
  UserSessionDto toDto() {
    return UserSessionDto(
      id: id,
      name: name,
      email: email,
      avatarUrl: avatarUrl,
      premium: premium,
      roles: roles,
    );
  }
}