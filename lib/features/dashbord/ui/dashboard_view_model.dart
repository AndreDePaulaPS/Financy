import 'package:flutter/foundation.dart';
import 'package:flutter_finance_app/core/session/domain/entitie/session.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_repository.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/dashboard_entity.dart';
import 'package:flutter_finance_app/shared/command/command.dart';

class DashboardViewModel extends ChangeNotifier {
  final IDashboardRepository _dashboardRepository;
  late Command<Session, Exception> loadUserCommand = Command();
  late Command<DashboardEntity, Exception> dashboardCommand = Command();

  DashboardViewModel(this._dashboardRepository) {
    loadUserCommand.addListener(notifyListeners);
    dashboardCommand.addListener(notifyListeners);
  }

  @override
  void dispose() {
    loadUserCommand.removeListener(notifyListeners);
    dashboardCommand.removeListener(notifyListeners);
    loadUserCommand.dispose();
    dashboardCommand.dispose();
    super.dispose();
  }

  Future<void> init() async {
    Future.wait([loadUser(), loadDashboard()]);
  }

  Future<void> loadUser() async {
    await loadUserCommand.execute(_dashboardRepository.loadUser);
  }

  Future<void> loadDashboard() async {
    await dashboardCommand.execute(_dashboardRepository.loadDashboard);
  }
}
