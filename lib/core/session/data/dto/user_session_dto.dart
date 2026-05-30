class UserSessionDto {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final bool premium;
  final List<Enum> roles;

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
        "roles": roles,
      };

  factory UserSessionDto.fromJson(Map<String, dynamic> json) {
    return UserSessionDto(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      avatarUrl: json["avatarUrl"],
      premium: json["premium"],
      roles: List<Enum>.from(json["roles"] ?? []),
    );
  }
}