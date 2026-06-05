import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboard_view.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboard_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class DashboadProvider extends StatelessWidget {
  const DashboadProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DashboardViewModel>(child: DashboardView(),);
  }
}