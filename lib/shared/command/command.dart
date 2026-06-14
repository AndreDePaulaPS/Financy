import 'package:flutter/material.dart';
import 'package:flutter_finance_app/shared/enum/e_command_state.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class Command<S, E extends Exception> extends ChangeNotifier {
  ECommandState _state = ECommandState.idle;

  bool _disposed = false;

  S? _success;

  S? get success => _success;

  E? _failure;
  E? get failure => _failure;

  bool get isIdle => _state == ECommandState.idle;
  bool get isLoading => _state == ECommandState.loading;
  bool get isSuccess => _state == ECommandState.success;
  bool get isFailure => _state == ECommandState.failure;

   void _safeNotifyListeners() {
    if (!_disposed) {
      notifyListeners();
    }
  }


  Future<void> execute(Future<Result<S, E>> Function() action)async{
    if (isLoading || _disposed) return;

    _success = null;
    _failure = null;

    _state = ECommandState.loading;
    notifyListeners();

    final result = await action();

    if (_disposed) return;

    result.when(
      success: (success) {
        _state = ECommandState.success;
        _success = success;
                
      }, 
      failure: (failure) {
        _state = ECommandState.failure;
        _failure = failure;
        
      },);
      _safeNotifyListeners();
  }

   @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}