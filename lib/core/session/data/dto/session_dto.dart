import 'dart:convert';

import 'package:flutter_finance_app/core/session/data/dto/user_session_dto.dart';

class SessionDto {
  final String token;
  final String refreshToken;
  final int expiresIn;
  final UserSessionDto user;

  SessionDto({
    required this.token,
    required this.refreshToken,
    required this.expiresIn,
    required this.user,
  });

  factory SessionDto.fromJson(Map<String, dynamic> json) {
    final user = json["user"] is String? jsonDecode(json["user"]): json["user"];

    return SessionDto(
      token: json["token"],
      refreshToken: json["refreshToken"],
      expiresIn: json["expiresIn"],
      user: UserSessionDto.fromJson(user),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "refreshToken": refreshToken,
      "expiresIn": expiresIn,
      "user": user.json,
    };
  }

  String get json => jsonEncode(toJson());
}
