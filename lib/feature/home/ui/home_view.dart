import 'package:flutter/material.dart';
import 'package:flutter_finance_app/feature/home/ui/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel homeVM;

  @override
  void initState() {
    super.initState();
    homeVM = context.read<HomeViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    },);
  }

  void init() async {
    await homeVM.loadUser();
  }
  
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return Scaffold(
      appBar:  AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            Text("${vm.loadUserCommand.success?.user.name}"),
            Text("${vm.loadUserCommand.success?.user.avatarUrl}"),
            Text("${vm.loadUserCommand.success?.user.email}")

          ],
        ),
      ),
    );
  }
}