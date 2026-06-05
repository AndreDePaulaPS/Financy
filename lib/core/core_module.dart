import 'package:dio/dio.dart';
import 'package:flutter_finance_app/core/di/i_feature_module.dart';
import 'package:flutter_finance_app/core/network/app_http_client.dart';
import 'package:flutter_finance_app/core/network/auth_interceptor.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_local_storage.dart';
import 'package:flutter_finance_app/core/local_storage/local_storage_impl.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/usecase/restore_session_usecase.dart';
import 'package:flutter_finance_app/core/session/session_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class CoreModule implements IFeatureModule{

  final GetIt _getIt;

  CoreModule(this._getIt);

  @override
  void register() {

    _getIt.registerLazySingleton<Dio>(() => Dio(),);

    _getIt.registerLazySingleton<FlutterSecureStorage>(
      () => FlutterSecureStorage(),
    );

    _getIt.registerLazySingleton<ILocalStorage>(
      () => LocalStorageImpl(_getIt<FlutterSecureStorage>()),
    );

    _getIt.registerLazySingleton<ISessionManager>(() => SessionManager(),);

    _getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(_getIt<ISessionManager>()),);

    _getIt.registerLazySingleton<AppHttpClient>(() => AppHttpClient(_getIt<Dio>(), _getIt<AuthInterceptor>()),);

    _getIt.registerLazySingleton<RestoreSessionUsecase>(() => RestoreSessionUsecase(_getIt<ISessionManager>(), _getIt<ILocalStorage>()),);
  }
}
