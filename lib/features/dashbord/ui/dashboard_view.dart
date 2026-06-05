import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/router/app_router_key.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboard_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardView();
}

class _DashboardView extends State<DashboardView> {
  late DashboardViewModel homeVM;

  @override
  void initState() {
    super.initState();
    homeVM = context.read<DashboardViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    },);
  }

  void init() async {
    await homeVM.loadUser();
  }
  
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DashboardViewModel>();
    return Scaffold(
      appBar:  AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            Text("${vm.loadUserCommand.success?.user.name}"),
            Text("${vm.loadUserCommand.success?.user.avatarUrl}"),
            Text("${vm.loadUserCommand.success?.user.email}"),
            ElevatedButton(onPressed: () async {
              await vm.clearSession();
              if(!context.mounted) return;
              context.go(AppRouterKey.login);

              
            }, child: Text("Logoff"))

          ],
        ),
      ),
    );
  }
}