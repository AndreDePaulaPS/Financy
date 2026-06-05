import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/features/splash/ui/splash_view_model.dart';
import 'package:flutter_finance_app/shared/widget/backgroud_degrade.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    },);
  }

  void init() async {
    final viewModel = context.read<SplashViewModel>();

     await viewModel.init();
     if (!mounted) return;

      if (viewModel.isLogged) {
        context.go(AppRouterKey.main);
      } else {
        context.go(AppRouterKey.onboarding);
      }
    
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SplashViewModel>();
    return Scaffold(
      body: BackgroudDegrade(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "financy",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 50, color: AppColors.white),
              ),
               const SizedBox(height: 24),

              if (vm.restoreCommand.isLoading)
                const CircularProgressIndicator(
                  color: AppColors.white,
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
