import 'package:flutter_finance_app/features/dashbord/data/dto/dashboard_dto.dart';
import 'package:flutter_finance_app/features/dashbord/data/mapper/recente_transaction_mapper.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/dashboard_entity.dart';

extension DashboardMapper on DashboardDto {
  DashboardEntity toDomain() {
    return DashboardEntity(
      balance: balance,
      income: income,
      expenses: expenses,
      recentTransactions: recentTransactions.map((e) => e.toDomain()).toList(),
    );
  }
}
