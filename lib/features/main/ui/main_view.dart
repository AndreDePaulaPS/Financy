import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/dashbord/ui/dashboad_provider.dart';
import 'package:flutter_finance_app/features/main/ui/main_view_model.dart';
import 'package:flutter_finance_app/features/perfil/ui/perfil_provider.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {


  static const _pages = [
    DashboadProvider(),
    PerfilProvider()
    
  ];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MainViewModel>();
    return Scaffold(
      body: IndexedStack(
        index: vm.index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: vm.index,
        onTap: vm.setIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ]),
    );
  }
}