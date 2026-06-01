import 'package:flutter_finance_app/core/di/app_module.dart';

class AppInitializer {

  static Future<void> init() async{
    
  await AppModule.register();
  }
}