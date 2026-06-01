import 'dart:convert';

import 'package:flutter_finance_app/shared/enum/e_roles.dart';
import 'package:flutter_finance_app/shared/extension/e_roles_extension.dart';

class UserSessionDto {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final bool premium;
  final List<ERoles> roles;

  UserSessionDto({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.premium,
    required this.roles,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatarUrl": avatarUrl,
        "premium": premium,
        "roles": roles.map((e) => e.value,).toList(),
      };

  factory UserSessionDto.fromJson(Map<String, dynamic> json) {
    return UserSessionDto(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      avatarUrl: json["avatarUrl"],
      premium: json["premium"],
      roles:(json["roles"] as List).map((e) =>(e as String).toRole(),).toList(),
    );
  }

  String get json => jsonEncode(toJson());
}