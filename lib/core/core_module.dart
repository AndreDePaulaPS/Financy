import 'package:dio/dio.dart';
import 'package:flutter_finance_app/core/network/app_http_client.dart';
import 'package:flutter_finance_app/core/network/auth_interceptor.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_local_storage.dart';
import 'package:flutter_finance_app/core/local_storage/local_storage_impl.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/session_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class CoreModule {
  void register(GetIt getIt) {

    getIt.registerLazySingleton<Dio>(() => Dio(),);

    getIt.registerLazySingleton<FlutterSecureStorage>(
      () => FlutterSecureStorage(),
    );

    getIt.registerLazySingleton<ILocalStorage>(
      () => LocalStorageImpl(getIt<FlutterSecureStorage>()),
    );

    getIt.registerLazySingleton<ISessionManager>(() => SessionManager(),);

    getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(getIt<ISessionManager>()),);

    getIt.registerLazySingleton<AppHttpClient>(() => AppHttpClient(getIt<Dio>(), getIt<AuthInterceptor>()),);
  }
}
