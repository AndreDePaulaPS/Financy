import 'package:flutter/foundation.dart';
import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/core/session/domain/usecases/clean_session_usecase.dart';
import 'package:flutter_finance_app/feature/home/domain/contract/i_home_repository.dart';
import 'package:flutter_finance_app/shared/command/command.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class HomeViewModel extends ChangeNotifier{
  final IHomeRepository _homeRepository;
  final CleanSessionUsecase _cleanSessionUsecase;
  late Command<Session, Exception> loadUserCommand = Command();
  late Command<void, Exception> clearSessionCommand = Command();

  HomeViewModel(this._homeRepository, this._cleanSessionUsecase);


  Future<void> loadUser() async {
    await loadUserCommand.execute(() => _homeRepository.loadUser(),);

    notifyListeners();
  }

  Future<void> clearSession()async{
    await clearSessionCommand.execute(() async {
      await _cleanSessionUsecase.call();
      return Success(null);
      });
  }


}