import 'package:decimal/decimal.dart';

import 'package:flutter_finance_app/features/dashbord/data/dto/recent_transaction_dto.dart';

class DashboardDto {
  final Decimal balance;
  final Decimal income;
  final Decimal expenses;
  final List<RecenteTransactionDto> recentTransactions;

  DashboardDto({
    required this.balance,
    required this.income,
    required this.expenses,
    required this.recentTransactions,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'balance': balance,
      'income': income,
      'expenses': expenses,
      'recentTransactions': recentTransactions.map((x) => x.toJson()).toList(),
    };
  }

  factory DashboardDto.fromJson(Map<String, dynamic> map) {
    return DashboardDto(
      balance: Decimal.parse(map['balance'].toString()),
      income: Decimal.parse(map['income'].toString()),
      expenses: Decimal.parse(map['expenses'].toString()),
      recentTransactions: (map['recentTransactions'] as List)
          .map((e) => RecenteTransactionDto.fromJson(e))
          .toList(),
    );
  }
}
