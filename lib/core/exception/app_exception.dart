class AppException implements Exception{
  final String mensagem;

  AppException({required this.mensagem});

  @override
  String toString() {
    return mensagem.replaceAll("Exception:", "");
  }
}
