class RegisterRequestDto {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterRequestDto({required this.email, required this.password, required this.name, required this.confirmPassword});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }
}