import 'package:flutter_finance_app/core/di/i_feature_module.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/usecases/restore_session_usecase.dart';
import 'package:flutter_finance_app/feature/splash/ui/splash_view_model.dart';
import 'package:get_it/get_it.dart';

class SplashModule implements IFeatureModule {
  final GetIt _getIt;

  SplashModule(this._getIt);

  @override
  void register() {
    _getIt.registerFactory<SplashViewModel>(() => SplashViewModel(_getIt<RestoreSessionUsecase>(), _getIt<ISessionManager>()),);
  }
}

