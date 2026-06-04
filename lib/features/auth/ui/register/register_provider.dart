import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/auth/ui/register/register_view.dart';
import 'package:flutter_finance_app/features/auth/ui/register/register_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RegisterViewModel>(
      child: RegisterView(),
    );
  }
}