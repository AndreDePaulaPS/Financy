import 'package:flutter_finance_app/core/core_module.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static Future<void> register(
    GetIt injector
  ) async{
    CoreModule(injector);
  }
}