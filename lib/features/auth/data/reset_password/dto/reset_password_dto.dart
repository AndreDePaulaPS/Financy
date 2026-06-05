class ResetPasswordDto {
  final String email;

  ResetPasswordDto({required this.email});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
    };
  }

}
