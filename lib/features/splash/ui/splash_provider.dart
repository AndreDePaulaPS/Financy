import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/splash/ui/splash_view.dart';
import 'package:flutter_finance_app/features/splash/ui/splash_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class SplashProvider extends StatelessWidget {
  const SplashProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashViewModel>(
      child: SplashView(),
    );
  }
}