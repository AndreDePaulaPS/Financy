import 'package:flutter_finance_app/core/core_module.dart';
import 'package:flutter_finance_app/features/auth/auth_module.dart';
import 'package:flutter_finance_app/features/dashbord/dashboard_module.dart';
import 'package:flutter_finance_app/features/main/main_module.dart';
import 'package:flutter_finance_app/features/perfil/perfil_module.dart';
import 'package:flutter_finance_app/features/splash/splash_module.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static final GetIt injector = GetIt.I;

  static Future<void> register(
  ) async{
    CoreModule(injector).register();
    SplashModule(injector).register();
    AuthModule(injector).register();
    MainModule(injector).register();
    DashboardModule(injector).register();
    PerfilModule(injector).register();

  }

  static T get<T extends Object>() {
    return injector<T>();
  }
}