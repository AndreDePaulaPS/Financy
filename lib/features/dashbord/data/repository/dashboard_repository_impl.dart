import 'package:flutter_finance_app/features/dashbord/data/mapper/dashboard_mapper.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_service.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/dashboard_entity.dart';
import 'package:flutter_finance_app/shared/exception/app_exception.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/entitie/session.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_repository.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class DashboardRepositoryImpl implements IDashboardRepository{
  final ISessionManager _sessionManager;
  final IDashboardService _dashboardService;

  DashboardRepositoryImpl(this._sessionManager, this._dashboardService);

  @override
  Future<Result<Session, Exception>> loadUser() async{
    final session = _sessionManager.loadSession();
    if(session != null) {
      return Success(session);
    }
    return Failure(AppException(mensagem: "Não existe usuário logado"));
  }

  @override
  Future<Result<DashboardEntity, Exception>> loadDashboard() async {
    final result = await _dashboardService.loadDashboard();

    return result.when(
      success: (success) {
        final entity = success.toDomain();
        return Success(entity);
      }, 
      failure: (failure) => Failure(failure),);
  }

  

  


}