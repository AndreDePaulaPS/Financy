import 'package:flutter_finance_app/shared/exception/app_exception.dart';
import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/feature/home/domain/contract/i_home_repository.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class HomeRepositoryImpl implements IHomeRepository{
  final ISessionManager _sessionManager;

  HomeRepositoryImpl(this._sessionManager);

  @override
  Future<Result<Session, Exception>> loadUser() async{
    final session = _sessionManager.loadSession();
    if(session != null) {
      return Success(session);
    }
    return Failure(AppException(mensagem: "Não existe usuário logado"));
  }

  


}