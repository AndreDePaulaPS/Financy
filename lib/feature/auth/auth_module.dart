import 'package:flutter_finance_app/core/network/app_http_client.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_finance_app/feature/auth/data/service/auth_service.dart';
import 'package:flutter_finance_app/feature/auth/domain/contract/i_auth_repository.dart';
import 'package:flutter_finance_app/feature/auth/domain/contract/i_auth_service.dart';
import 'package:flutter_finance_app/feature/auth/ui/login/login_view_model.dart';
import 'package:get_it/get_it.dart';

class AuthModule {
  final GetIt _getIt;

  AuthModule(this._getIt);

  void register(){
    _getIt.registerLazySingleton<IAuthService>(() => AuthService(_getIt<AppHttpClient>().dio),);
    _getIt.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(_getIt<IAuthService>(), _getIt<ILocalStorage>(), _getIt<ISessionManager>()),);
    _getIt.registerFactory<LoginViewModel>(() => LoginViewModel( _getIt<IAuthRepository>()),);
  }
}