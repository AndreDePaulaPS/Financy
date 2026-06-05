import 'package:flutter_finance_app/core/di/i_feature_module.dart';
import 'package:flutter_finance_app/features/perfil/ui/perfil_view_model.dart';
import 'package:get_it/get_it.dart';

class PerfilModule implements IFeatureModule {
  final GetIt _getIt;

  PerfilModule(this._getIt);
  
  @override
  void register() {
    _registerViewModel();
  }

  void _registerViewModel(){
    _getIt.registerFactory<PerfilViewModel>(() => PerfilViewModel(),);
  }
}