import 'package:flutter_finance_app/core/network/app_http_client.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/feature/auth/data/login/repository/auth_repository_impl.dart';
import 'package:flutter_finance_app/feature/auth/data/login/service/auth_service_impl.dart';
import 'package:flutter_finance_app/feature/auth/data/register/repository/register_repository_impl.dart';
import 'package:flutter_finance_app/feature/auth/data/register/service/register_service_impl.dart';
import 'package:flutter_finance_app/feature/auth/domain/login/contract/i_auth_repository.dart';
import 'package:flutter_finance_app/feature/auth/domain/login/contract/i_auth_service.dart';
import 'package:flutter_finance_app/feature/auth/domain/register/contract/i_register_repository.dart';
import 'package:flutter_finance_app/feature/auth/domain/register/contract/i_register_service.dart';
import 'package:flutter_finance_app/feature/auth/ui/login/login_view_model.dart';
import 'package:flutter_finance_app/feature/auth/ui/register/register_view_model.dart';
import 'package:get_it/get_it.dart';

class AuthModule {
  final GetIt _getIt;

  AuthModule(this._getIt);

  void register(){

    _getIt.registerLazySingleton<IAuthService>(() => AuthService(_getIt<AppHttpClient>().dio),);
    _getIt.registerLazySingleton<IRegisterService>(() => RegisterServiceImpl(_getIt<AppHttpClient>().dio),);

    _getIt.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(_getIt<IAuthService>(), _getIt<ILocalStorage>(), _getIt<ISessionManager>()),);
    _getIt.registerLazySingleton<IRegisterRepository>(() =>RegisterRepositoryImpl(_getIt<IRegisterService>(), _getIt<ISessionManager>(), _getIt<ILocalStorage>()));

    _getIt.registerFactory<LoginViewModel>(() => LoginViewModel( _getIt<IAuthRepository>()),);

    _getIt.registerFactory<RegisterViewModel>(() => RegisterViewModel(_getIt<IRegisterRepository>()),);
  }
}