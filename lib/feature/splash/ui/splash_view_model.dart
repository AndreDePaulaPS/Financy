import 'package:flutter/foundation.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/usecases/restore_session_usecase.dart';
import 'package:flutter_finance_app/shared/command/command.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class SplashViewModel extends ChangeNotifier {
  final RestoreSessionUsecase _restoreSession;
  final ISessionManager _sessionManager;

  late Command<void, Exception> restoreCommand = Command();

  SplashViewModel(this._restoreSession, this._sessionManager){
    restoreCommand.addListener(notifyListeners);
  }

  @override
  void dispose() {
    restoreCommand.removeListener(notifyListeners);
    restoreCommand.dispose();
    super.dispose();
  }

  bool get isLogged => _sessionManager.isLogged;

  Future<void> init() async {
    await restoreCommand.execute(() async {
      await _restoreSession.call();

      return Success(null);
    });

  } 
}