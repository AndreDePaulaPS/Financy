import 'package:flutter/foundation.dart';
import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/core/session/domain/usecases/clean_session_usecase.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_repository.dart';
import 'package:flutter_finance_app/shared/command/command.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class DashboardViewModel extends ChangeNotifier{
  final IDashboardRepository _dashboardRepository;
  final CleanSessionUsecase _cleanSessionUsecase;
  late Command<Session, Exception> loadUserCommand = Command();
  late Command<void, Exception> clearSessionCommand = Command();

  DashboardViewModel(this._dashboardRepository, this._cleanSessionUsecase);


  Future<void> loadUser() async {
    await loadUserCommand.execute(() => _dashboardRepository.loadUser(),);

    notifyListeners();
  }

  Future<void> clearSession()async{
    await clearSessionCommand.execute(() async {
      await _cleanSessionUsecase.call();
      return Success(null);
      });
  }


}