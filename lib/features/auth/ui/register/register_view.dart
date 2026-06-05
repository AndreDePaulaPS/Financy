import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/features/auth/ui/register/register_view_model.dart';
import 'package:flutter_finance_app/shared/validator/email_validator.dart';
import 'package:flutter_finance_app/shared/validator/password_validator.dart';
import 'package:flutter_finance_app/shared/validator/required_validator.dart';
import 'package:flutter_finance_app/shared/widget/bottom_sheet/app_bottom_sheet.dart';
import 'package:flutter_finance_app/shared/widget/button/app_button.dart';
import 'package:flutter_finance_app/shared/widget/text_form/app_text_form_fiel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void singUp(RegisterViewModel vm, BuildContext context) async {
    await vm.register();
    if (!context.mounted) return;
    if (vm.registerCommand.isSuccess) {
      context.go(AppRouterKey.main);
      return;
    }
    if (vm.registerCommand.isFailure) {
      appShowBottomSheet(
       context: context,
       text: vm.registerCommand.failure.toString(),
       textButton: "Try Again",
       onClick: () => context.pop(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RegisterViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Start Saving Your Money",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greenCard,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    "assets/register.png",
                    width: constraints.maxWidth * 50,
                    height: constraints.maxHeight * 0.25,
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: 20,
                      children: [
                        AppTextFormFiel(
                          textCapitalization: TextCapitalization.characters,
                          controller: vm.name,
                          label: "Your Name",
                          validator: (value) => RequiredValidator.validate(
                            value,
                            fieldName: "Name",
                          ),
                        ),
                        AppTextFormFiel(
                          controller: vm.email,
                          label: "Your email",
                          validator: EmailValidator.validate,
                        ),
                        AppTextFormFiel(
                          helperText:
                              "Must have at least 8 characters, 1 capital letter and 1 number.",
                          helperStyle: TextStyle(
                            fontSize: 11,
                            color: AppColors.greenSecondary,
                          ),
                          controller: vm.password,
                          label: "Choose your password",
                          isPassword: true,
                          obscureText: vm.passwordNotVisible,
                          showPassword: vm.tooglePassword,
                          validator: PasswordValidator.validatePassword,
                        ),
                        AppTextFormFiel(
                          controller: vm.confirmPassword,
                          label: "Confirm your password",
                          isPassword: true,
                          obscureText: vm.confirmPasswordNotVisible,
                          showPassword: vm.toogleConfirmPassword,
                          validator: (confirmPassword) =>
                              PasswordValidator.validateConfirmPassword(
                                confirmPassword,
                                vm.password.text,
                              ),
                        ),
                        vm.registerCommand.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : AppButton(
                                label: "Sing Up",
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    singUp(vm, context);
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have account? ",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: "sign in",
                          style: TextStyle(
                            color: AppColors.greenCard,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.go(AppRouterKey.login),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
