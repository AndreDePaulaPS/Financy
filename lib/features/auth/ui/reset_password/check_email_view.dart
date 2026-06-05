import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/shared/widget/button/app_button.dart';
import 'package:go_router/go_router.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Check Your \n Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greenCard,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/check_email.png",
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
                  child: AppButton(label: "Login", onTap: () {
                            context.go(AppRouterKey.login);
                          }),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
