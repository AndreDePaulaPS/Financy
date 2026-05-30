import 'package:flutter/material.dart';
import 'package:flutter_finance_app/shared/enum/e_command_state.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class Command<S, E extends Exception> extends ChangeNotifier {
  ECommandState _state = ECommandState.idle;

  Result<S, E>? _data;

  Result<S, E>? get data => _data;

  bool get isIdle => _state == ECommandState.idle;
  bool get isLoading => _state == ECommandState.loading;
  bool get isSuccess => _state == ECommandState.success;
  bool get isFailure => _state == ECommandState.failure;

  


  Future<void> execute(Future<Result<S, E>> Function() action)async{
    if(isLoading) return;

    _data = null;

    _state = ECommandState.loading;
    notifyListeners();

    final result = await action();

    _data = result;

    result.when(
      success: (success) {
        _state = ECommandState.success;
        return;
      }, 
      failure: (failure) {
        _state = ECommandState.failure;
        return ;
        
      },);
    
    notifyListeners();  
  }

  


}