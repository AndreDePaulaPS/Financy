import 'package:flutter/foundation.dart';
import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/feature/home/domain/contract/i_home_repository.dart';
import 'package:flutter_finance_app/shared/command/command.dart';

class HomeViewModel extends ChangeNotifier{
  final IHomeRepository _homeRepository;
  late Command<Session, Exception> loadUserCommand = Command();
  late Command<void, Exception> clearSessionCommand = Command();

  HomeViewModel(this._homeRepository);


  Future<void> loadUser() async {
    await loadUserCommand.execute(() => _homeRepository.loadUser(),);

    notifyListeners();
  }

  Future<void> clearSession()async{
    await clearSessionCommand.execute(_homeRepository.clearSession);
  }


}