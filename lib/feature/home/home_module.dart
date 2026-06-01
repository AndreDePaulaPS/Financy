import 'package:flutter_finance_app/core/di/i_feature_module.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/feature/home/data/repository/home_repository_impl.dart';
import 'package:flutter_finance_app/feature/home/domain/contract/i_home_repository.dart';
import 'package:flutter_finance_app/feature/home/ui/home_view_model.dart';
import 'package:get_it/get_it.dart';

class HomeModule implements IFeatureModule {
  final GetIt _getIt;

  HomeModule(this._getIt);

  @override
  void register() {
    _getIt.registerLazySingleton<IHomeRepository>(() => HomeRepositoryImpl(_getIt<ISessionManager>()),);
    _getIt.registerFactory<HomeViewModel>(() => HomeViewModel(_getIt<IHomeRepository>()),);
  }

}