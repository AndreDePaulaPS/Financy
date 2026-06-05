import 'package:flutter_finance_app/core/local_storage/local_storage_keys.dart';
import 'package:flutter_finance_app/core/session/data/mapper/session_mapper.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/entitie/session.dart';
import 'package:flutter_finance_app/features/auth/data/register/mapper/register_mapper.dart';
import 'package:flutter_finance_app/features/auth/domain/register/contract/i_register_repository.dart';
import 'package:flutter_finance_app/features/auth/domain/register/contract/i_register_service.dart';
import 'package:flutter_finance_app/features/auth/domain/register/input/register_input.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class RegisterRepositoryImpl implements IRegisterRepository{
  final IRegisterService _registerService;
  final ISessionManager _sessionManager;
  final ILocalStorage _localStorage;

  RegisterRepositoryImpl(this._registerService, this._sessionManager, this._localStorage);

  @override
  Future<Result<Session, Exception>> register(RegisterInput registerInput) async {
    final registerDto = registerInput.toDto();
    final result = await _registerService.register(registerDto);

    return result.when(
      success: (success)async {
        final session = success.toDomain();
        await _localStorage.save(LocalStorageKeys.session, success.json);
        await _sessionManager.save(session);
        return Success(session);
      }, 
      failure: (failure) => Failure(failure),);
  }
}