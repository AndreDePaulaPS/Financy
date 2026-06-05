import 'package:flutter_finance_app/core/di/i_feature_module.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/usecase/clean_session_usecase.dart';
import 'package:flutter_finance_app/features/dashbord/data/repository/dashboard_repository_impl.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_repository.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboard_view_model.dart';
import 'package:get_it/get_it.dart';

class HomeModule implements IFeatureModule {
  final GetIt _getIt;

  HomeModule(this._getIt);

  @override
  void register() {
    _getIt.registerLazySingleton<CleanSessionUsecase>(() => CleanSessionUsecase(_getIt<ISessionManager>(), _getIt<ILocalStorage>()),);
    _getIt.registerLazySingleton<IDashboardRepository>(() => DashboardRepositoryImpl(_getIt<ISessionManager>()),);
    _getIt.registerFactory<DashboardViewModel>(() => DashboardViewModel(_getIt<IDashboardRepository>(), _getIt<CleanSessionUsecase>(),));
  }

}