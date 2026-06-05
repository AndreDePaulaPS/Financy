import 'package:flutter_finance_app/core/di/app_module.dart';
import 'package:flutter_finance_app/core/router/app_router_guard.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
import 'package:flutter_finance_app/features/auth/ui/reset_password/check_email_view.dart';
import 'package:flutter_finance_app/features/auth/ui/reset_password/reset_password_provider.dart';
import 'package:flutter_finance_app/features/auth/ui/login/login_provider.dart';
import 'package:flutter_finance_app/features/auth/ui/register/register_provider.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboad_provider.dart';
import 'package:flutter_finance_app/features/main/ui/main_provider.dart';
import 'package:flutter_finance_app/features/onboarding/ui/onboarding_view.dart';
import 'package:flutter_finance_app/features/splash/ui/splash_provider.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter get route {
    final session = AppModule.get<ISessionManager>();
    final guard = AppRouterGuard(session);

    return GoRouter(
      initialLocation: AppRouterKey.splash,
      redirect: (context, state) => guard.redirect(state),
      routes: [
        GoRoute(
          path: AppRouterKey.splash,
          builder: (context, state) => SplashProvider(),
        ),
        GoRoute(path: AppRouterKey.main, builder: (_, _) => MainProvider()),
        GoRoute(path: AppRouterKey.onboarding, builder: (_, _) => OnboardingView()),
        GoRoute(path: AppRouterKey.login, builder: (_, _) => LoginProvider()),
        GoRoute(path: AppRouterKey.register, builder: (_, _) => RegisterProvider()),
        GoRoute(path: AppRouterKey.forgotPassword, builder: (_, _) => ResetPasswordProvider()),
        GoRoute(path: AppRouterKey.checkEmail, builder: (_, _) => CheckEmailView()),
        GoRoute(path: AppRouterKey.dashboard, builder: (_, _) => DashboadProvider()),
      ],
    );
  }
}
