import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/home/ui/home_view.dart';
import 'package:flutter_finance_app/features/home/ui/home_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(child: HomeView(),);
  }
}