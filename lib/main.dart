import 'package:flutter/material.dart';
import 'package:flutter_finance_app/app_initializer.dart';
import 'package:flutter_finance_app/core/router/app_router.dart';
import 'package:flutter_finance_app/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: AppRouter.route,
      
    );
  }
}
