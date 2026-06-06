import 'package:flutter/widgets.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';

class BackgroudDegrade extends StatelessWidget {
  final Widget? child;
  const BackgroudDegrade({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          AppColors.greenPrimary, AppColors.greenSecondary
        ],
        begin: AlignmentGeometry.topLeft,
        end: AlignmentGeometry.bottomRight)

      ),
      child: child,
    );
  }
}