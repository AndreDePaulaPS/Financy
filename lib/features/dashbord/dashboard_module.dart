import 'package:flutter_finance_app/core/di/i_feature_module.dart';
import 'package:flutter_finance_app/core/network/app_http_client.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
import 'package:flutter_finance_app/features/dashbord/data/repository/dashboard_repository_impl.dart';
import 'package:flutter_finance_app/features/dashbord/data/service/dashboard_service_impl.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_repository.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_service.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboard_view_model.dart';
import 'package:get_it/get_it.dart';

class DashboardModule implements IFeatureModule {
  final GetIt _getIt;

  DashboardModule(this._getIt);

  @override
  void register() {
    _registerService();
    _registerRepository();
    _registerViewModel();
  }

  void _registerService() {
    _getIt.registerLazySingleton<IDashboardService>(
      () => DashboardServiceImpl(_getIt<AppHttpClient>().dio),
    );
  }

  void _registerRepository() {
    _getIt.registerLazySingleton<IDashboardRepository>(
      () => DashboardRepositoryImpl(
        _getIt<ISessionManager>(),
        _getIt<IDashboardService>(),
      
      ),
    );
  }

  void _registerViewModel() {
    _getIt.registerFactory<DashboardViewModel>(
      () => DashboardViewModel(_getIt<IDashboardRepository>()),
    );
  }
}
