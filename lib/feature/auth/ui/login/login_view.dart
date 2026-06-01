import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/feature/auth/ui/login/login_view_model.dart';
import 'package:flutter_finance_app/shared/validator/email_validator.dart';
import 'package:flutter_finance_app/shared/validator/password_validator.dart';
import 'package:flutter_finance_app/shared/widget/button/app_button.dart';
import 'package:flutter_finance_app/shared/widget/text_form/app_text_form_fiel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formLoginKey,
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greenCard,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset("assets/welcome.png", width: constraints.maxWidth*0.25, height: constraints.maxHeight*0.25),
                    SizedBox(height: 20),
                    AppTextFormFiel(
                      controller: viewModel.email,
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                      validator: EmailValidator.validate,
                    ),
                    SizedBox(height: 20),
                    AppTextFormFiel(
                      controller: viewModel.password,
                      label: "Password",
                      obscureText: viewModel.isTextNotVisible,
                      isPassword: true,
                      showPassword: viewModel.tooglePassword,
                      validator: PasswordValidator.validate,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                    ),
                    SizedBox(height: 10),
                    viewModel.loginCommand.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : AppButton(
                            label: 'Login',
                            onTap: () async {
                              if (_formLoginKey.currentState!.validate()) {
                                await viewModel.login();
                                if (!context.mounted) return;
                                if (viewModel.loginCommand.isSuccess) {
                                  context.go(AppRouterKey.home);
                                }
                              }
                            },
                          ),
                    SizedBox(height: 8),
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
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
