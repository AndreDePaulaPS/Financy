import 'package:flutter_finance_app/core/local_storage/local_storage_keys.dart';
import 'package:flutter_finance_app/core/session/data/mapper/session_mapper.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/feature/auth/data/mapper/login_mapper_dto.dart';
import 'package:flutter_finance_app/feature/auth/domain/contract/i_auth_repository.dart';
import 'package:flutter_finance_app/feature/auth/domain/contract/i_auth_service.dart';
import 'package:flutter_finance_app/feature/auth/domain/input/login_input.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class AuthRepositoryImpl implements IAuthRepository{
  final IAuthService _service;
  final ISessionManager _sessionManager;
  final ILocalStorage _localStorage;

  AuthRepositoryImpl(this._service, this._localStorage, this._sessionManager);

  @override
  Future<Result<Session, Exception>> login(LoginInput auth) async {

    final result = await _service.login(auth.toDto());

    return result.when(
      success: (success) async {
        final session = success.toDomain();
        await _localStorage.save(LocalStorageKeys.session, success.json);
        await _sessionManager.save(session);
        return Success(session);
      }, 
      failure: (failure) => Failure(failure),);
  }
}