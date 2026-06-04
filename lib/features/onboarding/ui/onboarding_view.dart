import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/shared/widget/button/app_button.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Image.asset("assets/onbording.png"),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: 50,
                top: 30,
              ),
              child: Column(
                spacing: 20,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Spend Smarter Save More",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greenCard,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                 AppButton(label: "Get Started", onTap: () => context.go(AppRouterKey.register),),
                  RichText(
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
                          recognizer: TapGestureRecognizer()..onTap = () => context.go(AppRouterKey.login),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
