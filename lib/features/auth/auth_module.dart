import 'package:flutter_finance_app/core/network/app_http_client.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
import 'package:flutter_finance_app/features/auth/data/login/repository/auth_repository_impl.dart';
import 'package:flutter_finance_app/features/auth/data/login/service/auth_service_impl.dart';
import 'package:flutter_finance_app/features/auth/data/register/repository/register_repository_impl.dart';
import 'package:flutter_finance_app/features/auth/data/register/service/register_service_impl.dart';
import 'package:flutter_finance_app/features/auth/data/reset_password/repository/reset_passwrod_repository_impl.dart';
import 'package:flutter_finance_app/features/auth/data/reset_password/service/reset_password_service_impl.dart';
import 'package:flutter_finance_app/features/auth/domain/login/contract/i_auth_repository.dart';
import 'package:flutter_finance_app/features/auth/domain/login/contract/i_auth_service.dart';
import 'package:flutter_finance_app/features/auth/domain/register/contract/i_register_repository.dart';
import 'package:flutter_finance_app/features/auth/domain/register/contract/i_register_service.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/contract/i_reset_password_repository.dart';
import 'package:flutter_finance_app/features/auth/domain/reset_password/contract/i_reset_password_service.dart';
import 'package:flutter_finance_app/features/auth/ui/reset_password/reset_password_view_model.dart';
import 'package:flutter_finance_app/features/auth/ui/login/login_view_model.dart';
import 'package:flutter_finance_app/features/auth/ui/register/register_view_model.dart';
import 'package:get_it/get_it.dart';

class AuthModule {
  final GetIt _getIt;

  AuthModule(this._getIt);

  void register() {
    _registerService();
    _registerRepository();
    _registerViewModel();
  }

  void _registerService() {
    _getIt.registerLazySingleton<IAuthService>(
      () => AuthServiceImpl(_getIt<AppHttpClient>().dio),
    );
    _getIt.registerLazySingleton<IRegisterService>(
      () => RegisterServiceImpl(_getIt<AppHttpClient>().dio),
    );

    _getIt.registerLazySingleton<IResetPasswordService>(
      () => ResetPasswordServiceImpl(_getIt<AppHttpClient>().dio),
    );
  }

  void _registerRepository() {
    _getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(
        _getIt<IAuthService>(),
        _getIt<ILocalStorage>(),
        _getIt<ISessionManager>(),
      ),
    );
    _getIt.registerLazySingleton<IRegisterRepository>(
      () => RegisterRepositoryImpl(
        _getIt<IRegisterService>(),
        _getIt<ISessionManager>(),
        _getIt<ILocalStorage>(),
      ),
    );
    _getIt.registerLazySingleton<IResetPasswordRepository>(
      () => ResetPasswrodRepositoryImpl(_getIt<IResetPasswordService>()),
    );
  }

  void _registerViewModel() {
    _getIt.registerFactory<LoginViewModel>(
      () => LoginViewModel(_getIt<IAuthRepository>()),
    );
    _getIt.registerFactory<RegisterViewModel>(
      () => RegisterViewModel(_getIt<IRegisterRepository>()),
    );

    _getIt.registerFactory<ResetPasswordViewModel>(
      () => ResetPasswordViewModel(_getIt<IResetPasswordRepository>()),
    );
  }
}
