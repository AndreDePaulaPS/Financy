import 'package:flutter_finance_app/core/session/domain/entities/user_session.dart';

class Session {
  final String token;
  final String refreshToken;
  final int expiresIn;
  final UserSession user;
  

  Session({required this.token, required this.refreshToken, required this.expiresIn, required this.user});}