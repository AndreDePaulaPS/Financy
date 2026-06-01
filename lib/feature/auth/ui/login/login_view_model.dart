import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/feature/auth/domain/contract/i_auth_repository.dart';
import 'package:flutter_finance_app/feature/auth/domain/input/login_input.dart';
import 'package:flutter_finance_app/shared/command/command.dart';

class LoginViewModel extends ChangeNotifier {
  final IAuthRepository _repository;
  late Command<Session, Exception> loginCommand = Command();

  final email = TextEditingController();
  final password = TextEditingController();

  bool isTextNotVisible = true;


  LoginViewModel(this._repository){
    loginCommand.addListener(notifyListeners);

  }

  @override
  void dispose() {
    loginCommand.removeListener(notifyListeners);
    loginCommand.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }


  void tooglePassword() {
    isTextNotVisible = !isTextNotVisible;
    notifyListeners();
  }


  Future<void> login() async{
    final input = LoginInput(email: email.text, password: password.text);
    await loginCommand.execute(() => _repository.login(input),);

  }

}