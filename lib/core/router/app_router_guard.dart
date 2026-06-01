import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:go_router/go_router.dart';

class AppRouterGuard {
  final ISessionManager sessionManager;

  AppRouterGuard(this.sessionManager);

  String? redirect(
    GoRouterState state,
  ) {
    final hasSession =
        sessionManager.loadSession() != null;

    final isLogin =
        state.matchedLocation ==
        AppRouterKey.auth;

    if (!hasSession && !isLogin) {
      return AppRouterKey.auth;
    }

    if (hasSession && isLogin) {
      return AppRouterKey.home;
    }

    return null;
  }
}