import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboard_view_model.dart';
import 'package:flutter_finance_app/features/dashbord/ui/widget/card_widget.dart';
import 'package:flutter_finance_app/shared/widget/skeleton/app_skeleton.dart';
import 'package:flutter_finance_app/shared/widget/transaction_list/app_transaction_list.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardView();
}

class _DashboardView extends State<DashboardView> {
  late DashboardViewModel dashboardViewModel;

  @override
  void initState() {
    super.initState();
    dashboardViewModel = context.read<DashboardViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  void init() async {
    await dashboardViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DashboardViewModel>();
    final user = vm.loadUserCommand.success?.user;
    final transaction = vm.dashboardCommand.success;
    return Scaffold(

      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                  decoration: const BoxDecoration(
                    color: AppColors.greenPrimary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      const Text(
                        'Good afternoon,',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "${user?.name}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
      
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: -80,
                  child: vm.dashboardCommand.isLoading
                      ? AppSkeleton(
                          height: 180,
                          borderRadius: BorderRadius.circular(24),
                        )
                      : CardWidget(dashboard: vm.dashboardCommand.success),
                ),
              ],
            ),
      
            const SizedBox(height: 100),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Transactions History',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text('See all'),
                    ],
                  ),      
                  AppTransactionList(listItem: transaction?.recentTransactions ?? [])
                ],
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}
