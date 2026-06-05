import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/main/ui/main_view.dart';
import 'package:flutter_finance_app/features/main/ui/main_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainViewModel>(
      child: MainView(),
    );
  }
}