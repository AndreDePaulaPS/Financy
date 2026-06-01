import 'package:flutter_finance_app/core/di/app_module.dart';
import 'package:flutter_finance_app/core/router/app_router_guard.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/feature/auth/ui/login/login_provider.dart';
import 'package:flutter_finance_app/feature/home/ui/home_provider.dart';
import 'package:flutter_finance_app/feature/onbording/ui/onboarding_view.dart';
import 'package:flutter_finance_app/feature/splash/ui/splash_provider.dart';
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
        GoRoute(path: AppRouterKey.onboarding, builder: (_, _) => OnboardingView()),
        GoRoute(path: AppRouterKey.auth, builder: (_, _) => LoginProvider()),
        GoRoute(path: AppRouterKey.home, builder: (_, _) => HomeProvider()),
      ],
    );
  }
}
