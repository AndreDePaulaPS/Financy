import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/auth/ui/reset_password/reset_password_view.dart';
import 'package:flutter_finance_app/features/auth/ui/reset_password/reset_password_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class ResetPasswordProvider extends StatelessWidget {
  const ResetPasswordProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>(
      child: ResetPasswordView(),
    );
  }
}