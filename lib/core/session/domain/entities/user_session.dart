import 'package:flutter_finance_app/shared/enum/e_roles.dart';

class UserSession {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final bool premium;
  final List<ERoles> roles;

  UserSession({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.premium,
    required this.roles,
  });}