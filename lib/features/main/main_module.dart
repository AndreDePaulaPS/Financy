import 'package:flutter_finance_app/core/di/i_feature_module.dart';
import 'package:flutter_finance_app/features/main/ui/main_view_model.dart';
import 'package:get_it/get_it.dart';

class MainModule implements IFeatureModule{
  final GetIt _getIt;

  MainModule(this._getIt);

  @override
  void register() {
    _registerViewModel();
  }

  void _registerViewModel(){
    _getIt.registerFactory<MainViewModel>(() => MainViewModel(),);
  }
}