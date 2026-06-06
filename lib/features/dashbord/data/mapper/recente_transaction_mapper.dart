import 'package:flutter_finance_app/features/dashbord/data/dto/recent_transaction_dto.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/recent_transaction_entity.dart';

extension RecenteTransactionMapper on RecenteTransactionDto {
  RecentTransactionEntity toDomain() {
    return RecentTransactionEntity(
      id: id,
      title: title,
      amount: amount,
      category: category,
      date: DateTime.parse(date),
    );
  }
}
