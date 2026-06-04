import 'package:flutter_finance_app/core/core_module.dart';
import 'package:flutter_finance_app/features/auth/auth_module.dart';
import 'package:flutter_finance_app/features/home/home_module.dart';
import 'package:flutter_finance_app/features/splash/splash_module.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static final GetIt injector = GetIt.I;

  static Future<void> register(
  ) async{
    CoreModule(injector).register();
    SplashModule(injector).register();
    AuthModule(injector).register();
    HomeModule(injector).register();

  }

  static T get<T extends Object>() {
    return injector<T>();
  }
}