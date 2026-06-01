import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/di/app_module.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends ChangeNotifier>
    extends ChangeNotifierProvider<T> {
  ViewModelProvider({
    super.key,
    super.child,
  }): super(create: (context) => AppModule.get<T>(),);
}
