import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/contract/i_reset_password_repository.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/input/reset_password_input.dart';
import 'package:flutter_finance_app/shared/command/command.dart';

class ResetPasswordViewModel with ChangeNotifier {
  final IResetPasswordRepository _resetPasswordRepository;
  late final Command<void, Exception> resetPasswordCommand = Command();

  final TextEditingController email = TextEditingController();

  ResetPasswordViewModel(this._resetPasswordRepository) {
    resetPasswordCommand.addListener(notifyListeners);
  }

  @override
  void dispose() {
    resetPasswordCommand.removeListener(notifyListeners);
    resetPasswordCommand.dispose();
    email.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    final reset = ResetPasswordInput(email: email.text);
    await resetPasswordCommand.execute(
      () => _resetPasswordRepository.resetPassword(reset),
    );
  }
}
