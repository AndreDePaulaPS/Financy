import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:go_router/go_router.dart';

class AppRouterGuard {
  final ISessionManager sessionManager;

  AppRouterGuard(this.sessionManager);

  String? redirect(GoRouterState state) {
    final hasSession = sessionManager.loadSession() != null;

    final isPublic =
        state.matchedLocation == AppRouterKey.login ||
        state.matchedLocation == AppRouterKey.splash ||
        state.matchedLocation == AppRouterKey.onboarding ||
        state.matchedLocation == AppRouterKey.forgotPassword ||
        state.matchedLocation == AppRouterKey.checkEmail ||
        state.matchedLocation == AppRouterKey.register;

    if (!hasSession && !isPublic) {
      return AppRouterKey.splash;
    }

    if (hasSession && isPublic) {
      return AppRouterKey.home;
    }

    return null;
  }
}
