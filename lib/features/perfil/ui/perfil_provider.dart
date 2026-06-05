import 'package:flutter/material.dart';
import 'package:flutter_finance_app/features/perfil/ui/perfil_view.dart';
import 'package:flutter_finance_app/features/perfil/ui/perfil_view_model.dart';
import 'package:flutter_finance_app/shared/view_model_provider/view_model_provider.dart';

class PerfilProvider extends StatelessWidget {
  const PerfilProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PerfilViewModel>(
      child: PerfilView(),
    );
  }
}