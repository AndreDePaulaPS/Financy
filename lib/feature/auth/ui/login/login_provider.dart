import 'package:flutter/material.dart';
import 'package:flutter_finance_app/feature/auth/ui/login/login_view.dart';
import 'package:flutter_finance_app/feature/auth/ui/login/login_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>(child: LoginView());
  }
}
