import 'package:flutter_finance_app/shared/enum/e_roles.dart';

extension ERolesExtension on String{
  ERoles toRole(){
    return ERoles.values.firstWhere(
      (e) => e.name.toUpperCase() == toUpperCase(),
    );
  }
}

extension ERolesMapper on ERoles {
  String get value => name.toUpperCase();
}