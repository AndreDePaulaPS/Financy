class UserSession {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final bool premium;
  final List<Enum> roles;

  UserSession({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.premium,
    required this.roles,
  });}