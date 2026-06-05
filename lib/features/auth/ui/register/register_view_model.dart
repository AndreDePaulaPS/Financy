import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/session/domain/entitie/session.dart';
import 'package:flutter_finance_app/features/auth/domain/register/contract/i_register_repository.dart';
import 'package:flutter_finance_app/features/auth/domain/register/input/register_input.dart';
import 'package:flutter_finance_app/shared/command/command.dart';

class RegisterViewModel extends ChangeNotifier {
  final IRegisterRepository _registerRepository;
  late final Command<Session, Exception> registerCommand = Command();

  RegisterViewModel(this._registerRepository) {
    registerCommand.addListener(notifyListeners);
  }

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool passwordNotVisible = true;
  bool confirmPasswordNotVisible = true;

  @override
  void dispose() {
    registerCommand.removeListener(notifyListeners);
    registerCommand.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  Future<void> register() async {
    final registerInput = RegisterInput(
      name: name.text,
      email: email.text,
      password: password.text,
      confirmPassword: confirmPassword.text,
    );
    await registerCommand.execute(
      () => _registerRepository.register(registerInput),
    );
  }

  void tooglePassword() {
    passwordNotVisible = !passwordNotVisible;
    notifyListeners();
  }

  void toogleConfirmPassword() {
    confirmPasswordNotVisible = !confirmPasswordNotVisible;
    notifyListeners();
  }
}
