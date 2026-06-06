import 'package:flutter/material.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/dashboard_entity.dart';

class CardWidget extends StatelessWidget {
  final DashboardEntity? dashboard;
  const CardWidget({super.key, required this.dashboard});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.greenCard,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.greenCard.withValues(alpha: 0.25),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Balance', style: TextStyle(color: AppColors.white)),
              GestureDetector(
                child: Icon(Icons.more_horiz, color: Colors.white),
                onTap: () {
                },
              ),
            ],
          ),
          Text(
            "\$ ${dashboard?.balance.toStringAsFixed(2)}",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 4,
                children: [
                  Icon(Icons.arrow_circle_down, color: AppColors.white),
                  Text(
                    'Income\n\$ ${dashboard?.income.toStringAsFixed(2)}',
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(Icons.arrow_circle_up, color: AppColors.white),
                  Text(
                    'Expenses\n\$ ${dashboard?.expenses.toStringAsFixed(2)}',
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
