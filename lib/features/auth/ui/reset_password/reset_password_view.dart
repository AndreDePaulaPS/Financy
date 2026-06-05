import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/features/auth/ui/reset_password/reset_password_view_model.dart';
import 'package:flutter_finance_app/shared/validator/email_validator.dart';
import 'package:flutter_finance_app/shared/widget/button/app_button.dart';
import 'package:flutter_finance_app/shared/widget/text_form/app_text_form_fiel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ResetPasswordViewModel>();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Reset Your \n Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greenCard,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/reset_pasword.png",
                  width: constraints.maxWidth * 50,
                  height: constraints.maxHeight * .25,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Enter your email address and a link will be sent to reset your password.",
                    style: TextStyle(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: 20,
                      children: [
                        AppTextFormFiel(
                          validator: EmailValidator.validate,
                          controller: vm.email,
                          label: "Your Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        vm.resetPasswordCommand.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : AppButton(
                                label: "Send Link",
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await vm.resetPassword();
                                    if (!context.mounted) return;
                                    if (vm.resetPasswordCommand.isSuccess) {
                                      context.go(AppRouterKey.checkEmail);
                                    }
                                  }
                                },
                              ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don’t have Account? ",
                                style: TextStyle(color: AppColors.textPrimary),
                              ),
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(color: AppColors.greenCard),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.go(AppRouterKey.register);
                                  },
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
