import 'package:decimal/decimal.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/recent_transaction_entity.dart';

class DashboardEntity {
  final Decimal balance;
  final Decimal income;
  final Decimal expenses;
  final List<RecentTransactionEntity> recentTransactions;

  DashboardEntity({
    required this.balance,
    required this.income,
    required this.expenses,
    required this.recentTransactions,
  });
}
