import 'package:flutter_finance_app/core/session/domain/contract/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';

class CleanSessionUsecase {
  final ISessionManager _sessionManager;
  final ILocalStorage _storage;

  CleanSessionUsecase(this._sessionManager, this._storage);

  Future<void> call() async {
    await _sessionManager.clearSession();
    await _storage.deleteAll();
  }
}
