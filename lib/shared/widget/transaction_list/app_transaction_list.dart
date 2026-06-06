import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/recent_transaction_entity.dart';
import 'package:flutter_finance_app/shared/extension/datatime_extension.dart';

class AppTransactionList extends StatelessWidget {
  final List<RecentTransactionEntity> listItem;
  const AppTransactionList({super.key, required this.listItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listItem.length,
      itemBuilder: (context, index) {
        final item = listItem[index];
        final sinal = item.amount.isNegative;
        return ListTile(
          leading: CircleAvatar(child: Icon(Icons.account_circle_rounded)),
          title: Text(item.title),
          subtitle: Text(item.date.relativeDate),
          trailing: Text("${sinal ? '-' : '+'} \$ ${item.amount.abs().toStringAsFixed(2)}", style: TextStyle(fontSize: 20, color: sinal? AppColors.expense: AppColors.income),),
        );
      },
    );
  }
}
